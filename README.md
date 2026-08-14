# Digital Logic Design: Counters & Finite State Machines (FSMs)

> [!TIP]
> **Overview**: Welcome to the **Counters and FSMs** digital logic design repository. This project contains a structured suite of sequential logic designs—ranging from basic asynchronous (ripple) counters to high-speed synchronous counters, truncated decade counters, and bidirectional up/down counters. All designs feature schematic captures, gate-level logic implementations, and ISim simulation verification targeting Xilinx FPGAs (Spartan-3A & Artix-7) in Xilinx ISE.

---

## Project Index & Module Directory

| Module Directory | Primary Circuit Design | Clocking Architecture | Key Target / Feature | README Link |
| :--- | :--- | :--- | :--- | :--- |
| **`01_Asynchronus_Counter`** | 3-Bit Async Up/Down & General Ripple Counters | Cascaded Clock Chain | Sequential flip-flop clocking with minimal logic gates | [Read Overview](file:///c:/Users/himan/OneDrive/Documents/GitHub/Counters-and-FSms/01_Asynchronus_Counter/README.md) |
| **`02_Synchronus_Counter`** | 3-Bit Synchronous Counter | Parallel Master Clock | Simultaneous state updates eliminating cumulative delay | [Read Overview](file:///c:/Users/himan/OneDrive/Documents/GitHub/Counters-and-FSms/02_Synchronus_Counter/README.md) |
| **`03_MOD_10_Counter`** | MOD-10 (Decade / BCD) Truncated Counter | Truncated Reset Feedback | Automatic feedback reset ($Q_3 \cdot Q_1 = 1$) at state $1010_2$ | [Read Overview](file:///c:/Users/himan/OneDrive/Documents/GitHub/Counters-and-FSms/03_MOD_10_Counter/README.md) |
| **`04_Ripple_Counter`** | 3-Bit Up/Down Ripple Counter | Mode-Steered Cascaded Clock | Mode signal ($M$) steers $Q$ or $\bar{Q}$ via AND-OR gates | [Read Overview](file:///c:/Users/himan/OneDrive/Documents/GitHub/Counters-and-FSms/04_Ripple_Counter/README.md) |

---

## Architectural Comparison of Counter Types

```
1. ASYNCHRONOUS (RIPPLE) COUNTER:
   CLK ---> [TFF 0] ---> Q0 (drives next CLK) ---> [TFF 1] ---> Q1 ...
   (Propagation delay accumulates: N × t_pd)

2. SYNCHRONOUS COUNTER:
   CLK --------------------+------------------------+
                           |                        |
   CLK ---> [TFF 0]        +-------> [TFF 1]        +-------> [TFF 2]
   (All flip-flops trigger simultaneously on the master clock edge)

3. BIDIRECTIONAL UP/DOWN RIPPLE COUNTER:
   CLK ---> [TFF 0]--+-- Q0 --+--> [AND-OR Steering] ---> CLK ---> [TFF 1]
                    +-- Qb0 -+           ^
                                         | (Mode M = 1 UP / 0 DOWN)
```

### Key Technical Comparison Matrix

$$\begin{array}{l|c|c|c|c}
\mathbf{Counter\ Class} & \mathbf{Clocking\ Method} & \mathbf{Max\ Frequency} & \mathbf{Delay\ Complexity} & \mathbf{Primary\ Application} \\
\hline
\text{Asynchronous Ripple} & \text{Cascaded (Output} \rightarrow \text{CLK)} & \text{Lower} & \mathcal{O}(N \cdot t_{pd}) & \text{Frequency prescalers, low power} \\
\text{Synchronous Counter} & \text{Shared Master Clock} & \text{High} & \mathcal{O}(t_{pd} + t_{comb}) & \text{High-speed state machines, FPGAs} \\
\text{MOD-10 Decade} & \text{Truncated Feedback} & \text{Moderate} & \mathcal{O}(t_{pd} + t_{nand}) & \text{BCD displays, digital clocks} \\
\text{Up/Down Ripple} & \text{Mode Steering Net} & \text{Moderate} & \mathcal{O}(N \cdot t_{pd} + t_{steering}) & \text{Reversible timers, FIFO pointers} \\
\end{array}$$

---

## Module Highlights & Summary

### 01. Asynchronous (Ripple) Counters
* **Folder**: [`01_Asynchronus_Counter`](file:///c:/Users/himan/OneDrive/Documents/GitHub/Counters-and-FSms/01_Asynchronus_Counter/README.md)
* **Designs Included**: General 3-Bit Ripple Counter (`asyc_counter.sch`), 3-Bit Async Up Counter (`bit_3_asyn_up_counter.sch`), 3-Bit Async Down Counter (`Bit_3_asyn_down_counter.sch`).
* **Concept**: Cascades T Flip-Flops where the normal output ($Q$) or complementary output ($\bar{Q}$) acts as the clock input for the next stage.
* **Use Case**: Simple frequency division and low-gate-count counters.

### 02. Synchronous Counters
* **Folder**: [`02_Synchronus_Counter`](file:///c:/Users/himan/OneDrive/Documents/GitHub/Counters-and-FSms/02_Synchronus_Counter/README.md)
* **Designs Included**: 3-Bit Synchronous Up Counter (`syn_counter.sch`).
* **Concept**: All T Flip-Flops trigger on the exact same active edge of the master `CLK`. Next-state steering logic ($T_0=1$, $T_1=Q_0$, $T_2=Q_0 \cdot Q_1$) determines state transitions ahead of the clock pulse.
* **Use Case**: High-speed digital systems, FPGA registers, glitch-free control logic.

### 03. MOD-10 (Decade / BCD) Counter
* **Folder**: [`03_MOD_10_Counter`](file:///c:/Users/himan/OneDrive/Documents/GitHub/Counters-and-FSms/03_MOD_10_Counter/README.md)
* **Designs Included**: 4-Bit Truncated Decade Counter (`MOD_10_COUNTER.sch`).
* **Concept**: Integrates combinational NAND/AND feedback gates ($Q_3 \cdot Q_1 = 1$) to force an immediate reset to $0000_2$ upon reaching state $10$ ($1010_2$), constraining the sequence to 10 states (0 to 9).
* **Use Case**: 7-segment display drivers, BCD math units, decimal frequency dividers.

### 04. 3-Bit Up/Down Ripple Counter
* **Folder**: [`04_Ripple_Counter`](file:///c:/Users/himan/OneDrive/Documents/GitHub/Counters-and-FSms/04_Ripple_Counter/README.md)
* **Designs Included**: Bidirectional Up/Down Counter (`Ripple_counvr_up_down.sch`).
* **Concept**: Introduces AND-OR multiplexing logic between stages ($\text{CLK}_{n+1} = Q_n \cdot M + \bar{Q}_n \cdot \bar{M}$) controlled by Mode line $M$.
* **Use Case**: Dynamic up/down event counters, elevator floor indicators, stack memory pointers.

---

## Tools & Verification Suite

* **EDA CAD Environment**: Xilinx ISE Design Suite (Project Navigator vP.20131013)
* **Simulation Engine**: ISim Simulator (`.wdb` waveform database execution)
* **Target FPGA Architectures**:
  * Xilinx Spartan-3A (`xc3s700an-4fgg484`)
  * Xilinx Artix-7 (`xc7a100t-3csg324`)
* **Design File Formats**:
  * `.sch`: Gate-level schematic capture layouts
  * `.jhd`: Project hierarchy and symbol manifests
  * `.wdb` / `.wcfg`: ISim waveform simulation files

---

## Getting Started & Execution in Xilinx ISE

1. **Open Workspace**: Launch Xilinx ISE Design Suite and open the desired project file (`.xise`) located in any module directory.
2. **Hierarchy Inspection**: Select the design module in the **Design Hierarchy** pane (e.g., `syn_counter`, `MOD_10_COUNTER`, or `Ripple_counvr_up_down`).
3. **Simulate Behavioral Model**: Under the **Processes** pane, navigate to **ISim Simulator** $\rightarrow$ **Simulate Behavioral Model**.
4. **View Waveforms**: Analyze state transitions, reset behavior, and clock edge timing in the ISim Waveform window.

---

> [!TIP]
> **Summary**: This repository serves as a reference implementation for sequential counter design architectures. For additional details on specific schematics, ISim state transition tables, and boolean derivations, refer to the individual module `README.md` files linked above.
