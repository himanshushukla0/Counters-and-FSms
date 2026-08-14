# Parallel Clocking and High-Speed Sequential Logic: Synchronous Counter

> [!TIP]
> **Overview**: This directory contains the implementation, schematic capture, and ISim simulation verification for a 3-Bit Synchronous Counter (`syn_counter`) implemented on Spartan-3A FPGA target devices using Xilinx ISE. Unlike asynchronous ripple counters, synchronous counters trigger all flip-flops simultaneously via a shared master clock, eliminating cumulative propagation delay and enabling high-frequency sequential operations.

## The Architecture of Synchronous Counting

In a synchronous counter, every flip-flop stage triggers on the exact same active edge of the master clock (`CLK`). Combinational logic gates inspect the current state to evaluate the next-state excitation inputs (`T` or `J`/`K`) before the clock edge arrives. This parallel execution guarantees simultaneous state transitions across all bits.

### Key Architectural Advantages
1. **Zero Cumulative Ripple Delay**: State propagation delay is limited only to a single flip-flop propagation delay (`t_pd`) plus combinational gate delay (`t_comb`), regardless of bit width.
2. **Glitch-Free Decoding**: Synchronous state switching eliminates intermediate transient states, ensuring stable logic decoding for digital control logic and state machines.
3. **Parallel Clock Triggering**: All state elements (`Q0`, `Q1`, `Q2`) update on the exact same clock pulse transition.

---

## Design & Verification Artifacts

* **Schematic Layout**: Gate-level schematic layout (`syn_counter.sch`) featuring parallel flip-flop structures with next-state steering logic on Spartan-3A.
* **Simulation Database**: ISim simulation database and waveform trace configuration (`Default.wcfg` / `syn_counter_isim_beh.wdb`) verifying real-time timing execution.

## Tools & Signals Reference

* **Simulation Tool**: Xilinx ISE Design Suite (ISim Simulator vP.20131013)
* **Signal Pinout**:
  * `CLK`: Primary global master clock signal driving all flip-flop clock inputs simultaneously.
  * `CLR`: Active-HIGH Clear / Reset signal (forces counter outputs `Q2 Q1 Q0 = 000`).
  * `T`: Global toggle enable control signal (held HIGH to allow state transitions).
  * `Q0`: Counter output bit 0 (Least Significant Bit - LSB, $2^0$).
  * `Q1`: Counter output bit 1 ($2^1$).
  * `Q2`: Counter output bit 2 (Most Significant Bit - MSB, $2^2$).
  * `Q_DUMMY` / `Qb_DUMMY`: Intermediate net buffers driving internal feedback and status lines.

---

## Implemented Synchronous Counter & ISim State Transitions

### 01. 3-BIT SYNCHRONOUS COUNTER (`syn_counter`)

**Description**: A 3-bit synchronous binary counter operating on a shared master clock line (`CLK`). When `CLR` and `T` are asserted HIGH (1), the counter increments synchronously from `000` (0) to `111` (7) on each consecutive rising clock edge, rolling over smoothly back to `000` (0) on the 8th pulse.

| Simulation Timestamp | Clock Pulse | CLR | T | Q2 (2²) | Q1 (2¹) | Q0 (2⁰) | Output Count (Binary) | Decimal Count | State / Transition |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 1,378,131.00 µs | Initial | 1 | 1 | 0 | 0 | 0 | `000` | 0 | Initial / Start State (`000`) |
| 1,378,132.00 µs | 1 | 1 | 1 | 0 | 0 | 1 | `001` | 1 | Count 1 (`000` → `001`) |
| 1,378,133.00 µs | 2 | 1 | 1 | 0 | 1 | 0 | `010` | 2 | Count 2 (`001` → `010`) |
| 1,378,134.00 µs | 3 | 1 | 1 | 0 | 1 | 1 | `011` | 3 | Count 3 (`010` → `011`) |
| 1,378,135.00 µs | 4 | 1 | 1 | 1 | 0 | 0 | `100` | 4 | Count 4 (`011` → `100`) |
| 1,378,136.00 µs | 5 | 1 | 1 | 1 | 0 | 1 | `101` | 5 | Count 5 (`100` → `101`) |
| 1,378,137.00 µs | 6 | 1 | 1 | 1 | 1 | 0 | `110` | 6 | Count 6 (`101` → `110`) |
| 1,378,138.00 µs | 7 | 1 | 1 | 1 | 1 | 1 | `111` | 7 | Maximum Count (`111`) |
| 1,378,139.00 µs | 8 (Rollover) | 1 | 1 | 0 | 0 | 0 | `000` | 0 | Rollover (`111` → `000`) |
| 1,378,140.00 µs | 9 | 1 | 1 | 0 | 0 | 1 | `001` | 1 | Cycle Repeat (`000` → `001`) |

*Note: Simulation trace captured from ISim waveform execution run at `1378153 µs` marker.*
<img width="1587" height="829" alt="image" src="https://github.com/user-attachments/assets/76b2f593-8bc8-4cc7-b31a-5ade5e561e99" />
<img width="1578" height="824" alt="image" src="https://github.com/user-attachments/assets/e8909894-4a19-4e37-a16e-e8ddfe0cc140" />



---

### Next-State Logic & Excitation Equations

For a 3-bit synchronous binary up-counter utilizing T Flip-Flops:

$$\begin{aligned}
T_0 &= T = 1 \\
T_1 &= Q_0 \\
T_2 &= Q_0 \cdot Q_1
\end{aligned}$$

Each bit toggles on the active clock edge if and only if **all preceding lower-significant bits are 1**, ensuring simultaneous state updates without cumulative ripple delay.

---

> [!TIP]
> **Key Conclusion**: The synchronous counter setup avoids propagation delay accumulation by triggering `Q0`, `Q1`, and `Q2` on the single master clock `CLK`. Gating inputs via steering logic ensures high-speed, glitch-free operation compliant with Static Timing Analysis (STA) requirements.
