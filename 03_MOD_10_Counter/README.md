# Truncated Counting and BCD State Generation: MOD-10 (Decade) Counter

> [!TIP]
> **Overview**: This directory contains the implementation, schematic capture, symbol generation, and ISim simulation verification for a **MOD-10 (Decade / BCD) Counter** (`MOD_10_COUNTER`) targeting Xilinx FPGA devices in Xilinx ISE. A Modulo-10 counter is a truncated sequential circuit designed to cycle through exactly 10 states ($0000_2$ to $1001_2$ / decimal 0 to 9) before automatically resetting to $0000_2$ on the 10th clock pulse.

## The Architecture of MOD-10 Truncated Counting

Standard 4-bit binary counters naturally count through 16 states ($2^4 = 16$, from 0 to 15). To construct a **MOD-10 (Decade) Counter**, combinational feedback decoding logic is integrated into the sequential chain to force an early reset upon reaching state 10 ($1010_2$).

### 1. Truncation Feedback Gating Logic
* **Target State for Reset**: State 10 ($1010_2$), where $Q_3 = 1$, $Q_2 = 0$, $Q_1 = 1$, and $Q_0 = 0$.
* **Feedback Decoding Equation**:
  $$\text{RESET} = Q_3 \cdot Q_1$$
* **Operation**: An internal NAND/AND decoding gate (`XLXN_18`, `XLXN_21`) monitors output lines $Q_3$ and $Q_1$. As soon as the count transitions to $1010_2$, the gate instantly asserts the active Clear line (`CLR`), resetting all four flip-flops back to $0000_2$ within a fraction of a clock cycle (glitch reset mechanism).

### 2. Applications of Decade Counters
* **Binary Coded Decimal (BCD) Systems**: Directly drives 7-segment display decoders (e.g., 7447/CD4511).
* **Digital Clocks & Frequency Dividers**: Divides input clock frequencies by 10 for timing reference circuits.
* **Cascaded Multi-Digit Counters**: Generates a carry-out pulse on rollover to clock subsequent decade stages (units, tens, hundreds).

---

## Design & Verification Artifacts

* **Schematic Layout (`.sch`)**: Gate-level visual layouts (`MOD_10_COUNTER.sch`, `MOD_6_Counter.sch`) cascading `TFF` blocks with feedback reset gates in Xilinx ISE.
* **Project Hierarchy (`.jhd`)**: Project configuration and symbol dependency manifests for Xilinx ISE.
* **Waveforms (`.wdb` / `.wcfg`)**: ISim simulation databases (`MOD_10_COUNTER_isim_beh.wdb`, `Default.wcfg`) verifying real-time 10-state sequence execution.

## Tools & Signals Reference

* **Simulation Tool**: Xilinx ISE Design Suite (ISim Simulator vP.20131013)
* **Target Device**: Xilinx Artix-7 / Spartan-3A (`xc7a100t-3csg324`)
* **Signal Pinout**:
  * `CLK`: Input clock signal driving the LSB flip-flop stage (`XLXI_1`).
  * `CLR`: Asynchronous Clear / Reset signal (forces outputs `Q3 Q2 Q1 Q0 = 0000`).
  * `T`: Toggle control input line (tied HIGH to enable counting).
  * `Q0`, `Q1`, `Q2`, `Q3`: 4-bit binary output lines (`Q0` = LSB, `Q3` = MSB).
  * `Q[3:0]`: 4-bit consolidated output bus representing the active BCD count.
  * `Q_DUMMY[3:0]`: Output buffer nets for schematic capture monitoring.
  * `XLXN_18`, `XLXN_21`: Internal NAND/AND decoding feedback nets enforcing early reset at state $1010_2$.

---

## Implemented MOD-10 Counter & ISim State Transitions

### 01. MOD-10 DECADE COUNTER (`MOD_10_COUNTER`)

**Description**: A 4-bit decade counter configured with asynchronous reset feedback. The counter increments from `0000` (0) up to `1001` (9). On the 10th clock pulse ($1010_2$), the combinational logic detects $Q_3=1$ and $Q_1=1$, instantly triggering `CLR` to reset the output back to `0000` (0).

| Simulation Timestamp | Clock Pulse | CLR | T | Q3 (2³) | Q2 (2²) | Q1 (2¹) | Q0 (2⁰) | Output Bus (`Q[3:0]`) | Decimal Count | State / Transition Description |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 0.00 µs – 3.00 µs | Initial | 1 | 1 | 0 | 0 | 0 | 0 | `0000` | 0 | Initial Reset (`0000`) |
| 3.00 µs | Start | 1 | 1 | 0 | 0 | 0 | 0 | `0000` | 0 | Count 0 (`0000`) |
| 4.00 µs | 1 | 1 | 1 | 0 | 0 | 0 | 1 | `0001` | 1 | Count 1 (`0000` → `0001`) |
| 5.00 µs | 2 | 1 | 1 | 0 | 0 | 1 | 0 | `0010` | 2 | Count 2 (`0001` → `0010`) |
| 6.00 µs | 3 | 1 | 1 | 0 | 0 | 1 | 1 | `0011` | 3 | Count 3 (`0010` → `0011`) |
| 7.00 µs | 4 | 1 | 1 | 0 | 1 | 0 | 0 | `0100` | 4 | Count 4 (`0011` → `0100`) |
| 8.00 µs | 5 | 1 | 1 | 0 | 1 | 0 | 1 | `0101` | 5 | Count 5 (`0100` → `0101`) |
| 9.00 µs | 6 | 1 | 1 | 0 | 1 | 1 | 0 | `0110` | 6 | Count 6 (`0101` → `0110`) |
| 10.00 µs | 7 | 1 | 1 | 0 | 1 | 1 | 1 | `0111` | 7 | Count 7 (`0110` → `0111`) |
| 11.00 µs | 8 | 1 | 1 | 1 | 0 | 0 | 0 | `1000` | 8 | Count 8 (`0111` → `1000`) *(Marker X1: 11.00 µs)* |
| 12.00 µs | 9 | 1 | 1 | 1 | 0 | 0 | 1 | `1001` | 9 | Maximum BCD Count (`1001`) |
| 13.00 µs | 10 (Truncated) | 1 | 1 | 0 | 0 | 0 | 0 | `0000` | 0 | Auto-Reset on $1010_2 \rightarrow 0000_2$ |

*Note: Simulation trace captured from ISim waveform execution run with marker X1 at `11.000000 µs`.*

<img width="1587" height="832" alt="Screenshot 2026-08-14 111004" src="https://github.com/user-attachments/assets/2fcdc935-f6e4-45f6-9906-0ca5d05768a9" />
<img width="1589" height="823" alt="Screenshot 2026-08-14 111024" src="https://github.com/user-attachments/assets/363fe6af-d458-4954-b731-30b7fc5a989b" />



---

## State Transition & Reset Logic Summary

$$\begin{array}{c|cccc|c|c}
\mathbf{Decimal\ State} & \mathbf{Q_3} & \mathbf{Q_2} & \mathbf{Q_1} & \mathbf{Q_0} & \mathbf{Reset\ Logic\ (Q_3 \cdot Q_1)} & \mathbf{Next\ State} \\
\hline
0 & 0 & 0 & 0 & 0 & 0 & 0001 \\
1 & 0 & 0 & 0 & 1 & 0 & 0010 \\
2 & 0 & 0 & 1 & 0 & 0 & 0011 \\
3 & 0 & 0 & 1 & 1 & 0 & 0100 \\
4 & 0 & 1 & 0 & 0 & 0 & 0101 \\
5 & 0 & 1 & 0 & 1 & 0 & 0110 \\
6 & 0 & 1 & 1 & 0 & 0 & 0111 \\
7 & 0 & 1 & 1 & 1 & 0 & 1000 \\
8 & 1 & 0 & 0 & 0 & 0 & 1001 \\
9 & 1 & 0 & 0 & 1 & 0 & 1010 \rightarrow 0000\ \text{(Reset!)} \\
\hline
10\ \text{(Transient)} & 1 & 0 & 1 & 0 & 1\ \text{(ACTIVE)} & 0000 \\
\end{array}$$

---

> [!TIP]
> **Key Conclusion**: The MOD-10 (Decade) Counter demonstrates how combinational logic gates can truncate natural binary counting sequences ($2^N$). By detecting $1010_2$ ($Q_3 \cdot Q_1 = 1$) to force an immediate reset, the circuit reliably restricts execution to 10 states (0 through 9), making it ideal for digital BCD displays and metric division logic.
