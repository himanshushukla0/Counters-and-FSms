# Ripple Counting and Frequency Division: Asynchronous Counters

> [!TIP]
> **Overview**: This directory contains the implementation, schematic captures, symbol generation, and verification files for asynchronous (ripple) counters built using Spartan-3A FPGA target devices in Xilinx ISE. Building upon fundamental memory elements like T Flip-Flops (`TFF`), these circuits cascade clock signals sequentially to demonstrate how digital systems increment, decrement, and track event cycles.

## The Architecture of Ripple Counting

While synchronous counters trigger all memory elements simultaneously using a single shared clock, asynchronous counters simplify hardware by cascading flip-flops—where the output of one flip-flop acts as the clock input for the next. This creates a sequential "ripple" effect through the binary stages, making ripple counters ideal for low-power event tracking, frequency division, and digital prescaling where minimal routing complexity is preferred.

### 1. Asynchronous Counter: The Cascaded Clock Chain

The general asynchronous counter connects T Flip-Flops (`TFF`) in a daisy-chain configuration with `T = 1`. Since each stage toggles only when triggered by the preceding stage's output, propagation delay accumulates proportionally with every additional bit (`N × t_pd`).

* **The Application**: It is primarily used in frequency division networks, prescalers, and applications where low gate count and hardware simplicity outweigh propagation delay limitations.

### 2. 3-Bit Asynchronous Up Counter: The Binary Incrementer

The 3-bit up counter cascades three flip-flops (`XLXI_1`, `XLXI_2`, `XLXI_3`) to count sequentially upwards in binary from `000` (0) to `111` (7), resetting to `000` on the 8th clock pulse.

* **The Application**: Essential for tracking ascending event sequences, index registers, cycle counters, and generating multi-phase timing signals in digital systems.

### 3. 3-Bit Asynchronous Down Counter: The Binary Decrementer

The 3-bit down counter configures inverted output clocking (`Qb` / `Q_bar`) using internal net drivers (`XLXN_3`, `XLXN_4`) to count sequentially downwards in binary from `111` (7) to `000` (0), wrapping around back to `111`.

* **The Application**: Ideal for countdown timers, remaining-resource trackers, time-out control logic, and decrementing stack or FIFO pointers.

---

## Design & Verification Artifacts

* **Schematics (`.sch`)**: Gate-level visual layouts (`asyc_counter.sch`, `bit_3_asyn_up_counter.sch`, `Bit_3_asyn_down_counter.sch`) cascading `TFF` blocks on Spartan-3A.
* **Project Hierarchy (`.jhd`)**: Project configuration and symbol dependency manifests for Xilinx ISE.
* **Waveforms (`.wdb`)**: ISim simulation databases (`asyc_counter_isim_beh1.wdb`, `bit_3_asyn_up_counter_isim_beh.wdb`, `Bit_3_asyn_down_counter_isim_beh1.wdb`) verifying real-time waveform timing traces.

## Tools & Signals Reference

* **Simulation Tool**: Xilinx ISE Design Suite (ISim Simulator vP.20131013)
* **Signal Pinout**:
  * `CLK`: Primary input clock signal driving the LSB stage (`XLXI_1`).
  * `CLR` / `Clr`: Asynchronous Clear / Reset signal (forces outputs `Q2 Q1 Q0 = 000`).
  * `T`: Toggle control line (tied HIGH to enable toggling on every active clock edge).
  * `Q0`, `Q1`, `Q2`: 3-bit binary counter outputs (`Q0` = LSB, `Q2` = MSB).
  * `Q0_DUMMY`, `Q1_DUMMY`: Intermediate stage output buffers driving subsequent flip-flop clock inputs in schematic capture.
  * `XLXN_3`, `XLXN_4`: Internal complementary output nets (`Qb`) used for down-counter clock triggering.

---

## Implemented Asynchronous Counters & ISim State Transitions

### 01. GENERAL ASYNCHRONOUS COUNTER (`asyc_counter`)

**Description**: A 3-bit ripple counter capturing `CLK`, `Clr` reset, intermediate stage dummy outputs (`Q0_DUMMY`, `Q1_DUMMY`), and internal nets (`XLXN_3`). When `Clr` is asserted (HIGH), all outputs reset to 0. Upon releasing `Clr`, the counter increments on each negative clock edge.

| Simulation Timestamp | CLK | Clr | Q2 (2²) | Q1 (2¹) | Q0 (2⁰) | Q1_DUMMY | Q0_DUMMY | XLXN_3 | Output Count | State / Description |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 0.00 µs – 3.00 µs | 0/1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | Initial Reset (`Clr` LOW) |
| 3.00 µs | 1 | 1 | 0 | 0 | 1 | 0 | 1 | 0 | 1 | Count 1 (`001`) |
| 4.00 µs | 1 | 1 | 0 | 1 | 0 | 1 | 0 | 1 | 2 | Count 2 (`010`) |
| 5.00 µs | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 3 | Count 3 (`011`) |
| 6.00 µs | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 4 | Count 4 (`100`) |
| 7.00 µs | 1 | 1 | 1 | 0 | 1 | 0 | 1 | 0 | 5 | Count 5 (`101`) |
| 8.00 µs | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 1 | 6 | Count 6 (`110`) *(Marker X1: 8.625 µs)* |
| 9.00 µs | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 7 | Count 7 (`111`) |
| 10.00 µs | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | Rollover (`000`) |

<img width="1628" height="845" alt="Screenshot 2026-08-05 235717" src="https://github.com/user-attachments/assets/bd6a26ca-ac8c-4795-bbfa-500cbfe33851" />
<img width="1627" height="857" alt="Screenshot 2026-08-06 000029" src="https://github.com/user-attachments/assets/e51ba2c4-b763-42ff-abbd-4efe7a1bffc5" />

---

### 02. 3-BIT ASYNCHRONOUS UP COUNTER (`bit_3_asyn_up_counter`)

**Description**: A 3-bit binary ripple up counter built with cascaded `TFF` blocks (`XLXI_1`, `XLXI_2`, `XLXI_3`). The output `Q0` drives the clock of `Q1`, and `Q1` drives the clock of `Q2`, causing the output to increment sequentially from `000` (0) up to `111` (7).

| Simulation Timestamp | Clock Pulse | Clr | Q2 (2²) | Q1 (2¹) | Q0 (2⁰) | Decimal Count | State / Transition |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 0.00 µs – 3.00 µs | Initial | 0 | 0 | 0 | 0 | 0 | Reset State (`Clr` LOW) |
| 3.00 µs | 1 | 1 | 0 | 0 | 1 | 1 | Increment (`000` → `001`) |
| 4.00 µs | 2 | 1 | 0 | 1 | 0 | 2 | Increment (`001` → `010`) |
| 5.00 µs | 3 | 1 | 0 | 1 | 1 | 3 | Increment (`010` → `011`) |
| 6.00 µs | 4 | 1 | 1 | 0 | 0 | 4 | Increment (`011` → `100`) |
| 7.00 µs | 5 | 1 | 1 | 0 | 1 | 5 | Increment (`100` → `101`) |
| 8.00 µs | 6 | 1 | 1 | 1 | 0 | 6 | Increment (`101` → `110`) |
| 9.00 µs | 7 | 1 | 1 | 1 | 1 | 7 | Maximum Count (`111`) |
| 10.00 µs | 8 (Overflow) | 1 | 0 | 0 | 0 | 0 | Rollover (`111` → `000`) |

<img width="1723" height="881" alt="Screenshot 2026-08-06 000122" src="https://github.com/user-attachments/assets/159c54a7-46c0-45ac-8d71-e3d0f74545a1" />


---

### 03. 3-BIT ASYNCHRONOUS DOWN COUNTER (`Bit_3_asyn_down_counter`)

**Description**: A 3-bit binary ripple down counter using complementary outputs `Qb` (`XLXN_3`, `XLXN_4`) to clock subsequent flip-flop stages. On each active clock transition, the stored binary count decrements sequentially from `111` (7) down to `000` (0).

| Simulation Timestamp | Clock Pulse | Clr | Q2 (2²) | Q1 (2¹) | Q0 (2⁰) | Decimal Count | State / Transition |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 4.00 µs | Initial | 1 | 1 | 1 | 1 | 7 | Preset / Start State (`111`) |
| 5.00 µs | 1 | 1 | 1 | 1 | 0 | 6 | Decrement (`111` → `110`) |
| 6.00 µs | 2 | 1 | 1 | 0 | 1 | 5 | Decrement (`110` → `101`) |
| 7.00 µs | 3 | 1 | 1 | 0 | 0 | 4 | Decrement (`101` → `100`) |
| 8.00 µs | 4 | 1 | 0 | 1 | 1 | 3 | Decrement (`100` → `011`) |
| 9.00 µs | 5 | 1 | 0 | 1 | 0 | 2 | Decrement (`011` → `010`) |
| 10.00 µs | 6 | 1 | 0 | 0 | 1 | 1 | Decrement (`010` → `001`) |
| 11.00 µs | 7 | 1 | 0 | 0 | 0 | 0 | Minimum Count (`000`) |
| 12.00 µs | 8 (Underflow) | 1 | 1 | 1 | 1 | 7 | Rollover (`000` → `111`) |

---


> [!TIP]
> **Key Conclusion**: Asynchronous counters excel in low-power, resource-constrained prescaling applications where simple logic overrides propagation speed requirements. For high-frequency FPGA implementations (such as Spartan-3A), synchronous counters are recommended to eliminate ripple delays, prevent decoding glitches, and satisfy strict static timing analysis (STA) constraints.

