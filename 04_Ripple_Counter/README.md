# Mode-Controlled Up/Down Ripple Counting: 3-Bit Up/Down Ripple Counter

> [!TIP]
> **Overview**: This directory contains the implementation, schematic capture, symbol generation, and ISim simulation verification for a **3-Bit Asynchronous (Ripple) Up/Down Counter** (`Ripple_counvr_up_down`) built on Spartan-3A FPGA target devices (`xc3s700an-4fgg484`) in Xilinx ISE. Combining T Flip-Flops (`TFF`), combinational steering logic (AND-OR gates), and a Mode Control line (`M`), this circuit dynamically toggles between binary up-counting and down-counting operations.

## The Architecture of Up/Down Ripple Counting

Standard ripple counters count exclusively upwards or downwards depending on whether the normal output ($Q$) or inverted output ($\bar{Q}$) drives the clock input of the subsequent flip-flop stage. A **3-Bit Up/Down Ripple Counter** introduces combinational multiplexing logic between consecutive flip-flop stages, allowing a single Mode signal ($M$) to steer either $Q$ or $\bar{Q}$ to the next clock input.

```
       +-----+          +---------------+          +-----+
CLK -->| TFF |--- Q0 --->|  AND-OR Gate  |---> CLK->| TFF |---> Q1 ...
       | Q0  |--- Qb0 -->| Steering Net  |          | Q1  |
       +-----+          +---------------+          +-----+
                           ^         ^
                           |         |
                          (M)   (M_bar via INV)
```

### 1. Steering Logic & Mode Control Mechanism

* **Mode Selection Line ($M$)**:
  * **Up-Count Mode ($M = 1$)**: When $M$ is HIGH, the inverted mode signal $\bar{M} = 0$. The top `AND2` gate passes the non-inverted output $Q_n$ through the `OR2` gate to clock stage $(n+1)$. The counter increments sequentially from $000_2$ (0) up to $111_2$ (7).
  * **Down-Count Mode ($M = 0$)**: When $M$ is LOW, the inverted mode signal $\bar{M} = 1$ (via `INV`). The bottom `AND2` gate passes the complementary output $\bar{Q}_n$ ($Qb_n$) through the `OR2` gate to clock stage $(n+1)$. The counter decrements sequentially from $111_2$ (7) down to $000_2$ (0).

### 2. Boolean Steering Logic Equation

For any stage $n$ driving stage $n+1$:
$$\text{CLK}_{n+1} = (Q_n \cdot M) + (\bar{Q}_n \cdot \bar{M})$$

* **When $M = 1$**: $\text{CLK}_{n+1} = (Q_n \cdot 1) + (\bar{Q}_n \cdot 0) = Q_n$ (Up Counter Configuration)
* **When $M = 0$**: $\text{CLK}_{n+1} = (Q_n \cdot 0) + (\bar{Q}_n \cdot 1) = \bar{Q}_n$ (Down Counter Configuration)

### 3. Applications of Bidirectional Ripple Counters

* **Reversible Event Trackers**: Systems requiring dual-direction count tracking, such as elevator floor indicators or bidirectional inventory counters.
* **FIFO / LIFO Memory Pointers**: Dynamically tracking stack occupancy with push (up) and pop (down) operations.
* **Digital Up/Down Timers & Frequency Prescalers**: Generating programmable up/down frequency sweeps with minimal routing overhead.

---

## Design & Verification Artifacts

* **Schematic Layout (`.sch`)**: Gate-level schematic layout (`Ripple_counvr_up_down.sch`) cascading three `TFF` blocks with `INV`, `AND2`, and `OR2` steering logic on Spartan-3A.
* **Project Hierarchy (`.jhd`)**: Project configuration and symbol dependency manifests for Xilinx ISE.
* **Waveforms (`.wdb`)**: ISim simulation databases verifying dynamic mode transitions and timing waveforms under active clock triggering.

## Tools & Signals Reference

* **Simulation Tool**: Xilinx ISE Design Suite (ISim Simulator vP.20131013)
* **Target Device**: Xilinx Spartan-3A (`xc3s700an-4fgg484`)
* **Signal Pinout**:
  * `CLK`: Primary input clock driving the LSB flip-flop stage (`XLXI_1`).
  * `CLR`: Active-HIGH Asynchronous Clear / Reset signal (forces outputs $Q_2 Q_1 Q_0 = 000$).
  * `T`: Global toggle enable control line (tied HIGH to enable toggling).
  * `M`: Mode selection control line ($M = 1 \rightarrow$ UP Count, $M = 0 \rightarrow$ DOWN Count).
  * `INV`: Inverter gate generating the complementary mode signal $\bar{M}$.
  * `AND2` / `OR2`: Combinational gating array steering $Q$ or $\bar{Q}$ to the next stage's clock line.
  * `Q0`, `Q1`, `Q2`: 3-bit binary output lines ($Q_0$ = LSB, $Q_2$ = MSB).
  * `Qb` / `Q_bar`: Complementary outputs of each T Flip-Flop stage used for down-count clock generation.

---

## Implemented Up/Down Ripple Counter & ISim State Transitions

### 01. 3-BIT RIPPLE UP/DOWN COUNTER (`Ripple_counvr_up_down`)

**Description**: A 3-bit bidirectional ripple counter incorporating combinational mode steering. When `CLR` is released and `T = 1`, setting `M = 1` causes the counter to step upwards from `000` to `111`. Switching `M = 0` causes the counter to step downwards from `111` to `000`.

#### Up-Count Mode Sequence ($M = 1$)

| Clock Pulse | CLR | Mode ($M$) | Q2 (2²) | Q1 (2¹) | Q0 (2⁰) | Output Bus (`Q[2:0]`) | Decimal Count | State / Transition |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| Initial | 0 | 1 | 0 | 0 | 0 | `000` | 0 | Reset State (`CLR` active) |
| 1 | 1 | 1 | 0 | 0 | 1 | `001` | 1 | Increment (`000` → `001`) |
| 2 | 1 | 1 | 0 | 1 | 0 | `010` | 2 | Increment (`001` → `010`) |
| 3 | 1 | 1 | 0 | 1 | 1 | `011` | 3 | Increment (`010` → `011`) |
| 4 | 1 | 1 | 1 | 0 | 0 | `100` | 4 | Increment (`011` → `100`) |
| 5 | 1 | 1 | 1 | 0 | 1 | `101` | 5 | Increment (`100` → `101`) |
| 6 | 1 | 1 | 1 | 1 | 0 | `110` | 6 | Increment (`101` → `110`) |
| 7 | 1 | 1 | 1 | 1 | 1 | `111` | 7 | Maximum Count (`111`) |
| 8 (Rollover) | 1 | 1 | 0 | 0 | 0 | `000` | 0 | Rollover (`111` → `000`) |

#### Down-Count Mode Sequence ($M = 0$)

| Clock Pulse | CLR | Mode ($M$) | Q2 (2²) | Q1 (2¹) | Q0 (2⁰) | Output Bus (`Q[2:0]`) | Decimal Count | State / Transition |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| Initial | 1 | 0 | 1 | 1 | 1 | `111` | 7 | Start / Preset State (`111`) |
| 1 | 1 | 0 | 1 | 1 | 0 | `110` | 6 | Decrement (`111` → `110`) |
| 2 | 1 | 0 | 1 | 0 | 1 | `101` | 5 | Decrement (`110` → `101`) |
| 3 | 1 | 0 | 1 | 0 | 0 | `100` | 4 | Decrement (`101` → `100`) |
| 4 | 1 | 0 | 0 | 1 | 1 | `011` | 3 | Decrement (`100` → `011`) |
| 5 | 1 | 0 | 0 | 1 | 0 | `010` | 2 | Decrement (`011` → `010`) |
| 6 | 1 | 0 | 0 | 0 | 1 | `001` | 1 | Decrement (`010` → `001`) |
| 7 | 1 | 0 | 0 | 0 | 0 | `000` | 0 | Minimum Count (`000`) |
| 8 (Underflow)| 1 | 0 | 1 | 1 | 1 | `111` | 7 | Rollover (`000` → `111`) |

---

## State Transition & Mode Logic Summary

$$\begin{array}{c|ccc|c|c}
\mathbf{Current\ State} & \mathbf{Q_2} & \mathbf{Q_1} & \mathbf{Q_0} & \mathbf{Next\ State\ (M=1,\ Up)} & \mathbf{Next\ State\ (M=0,\ Down)} \\
\hline
0 & 0 & 0 & 0 & 001 & 111 \\
1 & 0 & 0 & 1 & 010 & 000 \\
2 & 0 & 1 & 0 & 011 & 001 \\
3 & 0 & 1 & 1 & 100 & 010 \\
4 & 1 & 0 & 0 & 101 & 011 \\
5 & 1 & 0 & 1 & 110 & 100 \\
6 & 1 & 1 & 0 & 111 & 101 \\
7 & 1 & 1 & 1 & 000\ \text{(Rollover)} & 110 \\
\end{array}$$

---

> [!TIP]
> **Key Conclusion**: The 3-bit up/down ripple counter effectively combines mode steering logic ($Q \cdot M + \bar{Q} \cdot \bar{M}$) with sequential T flip-flops to achieve bidirectional binary counting. While ideal for resource-constrained FPGA designs requiring simple up/down functionality, propagation delays propagate through the steering logic and cascaded clock stages ($N \times t_{pd} + t_{comb}$), making synchronous up/down counters preferable for high-speed systems under strict timing analysis.
