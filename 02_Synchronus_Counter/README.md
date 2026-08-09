# Synchronous Counters

> 💡 **Tip**
> 
> Overview: This directory contains the implementation, schematic captures, and verification files for sequential logic components, specifically Synchronous Counters. This module demonstrates the ability to construct state-based computational blocks. **Architectural Note:** To maintain a standardized data path, these components output to a full 8-bit bus, but the core sequential logic acts specifically on the least significant 4 bits (the lower nibble) to calculate the state transitions.

---

## Design & Verification Artifacts

*   **Schematics**: Visual gate-level layouts mapping clock and control inputs to outputs, including next-state combinational logic and flip-flop arrays.
*   **Waveforms**: Simulation traces verifying that each circuit matches its theoretical state table under timing analysis.

## Tools Used

*   **Simulation & Capture**: Xilinx Design Tools / XSI

## Implemented Sequential Logic

*   **Synchronous Counters (State Generation)**: 4-bit Synchronous Up-Counter (Generates a full 8-bit output bus, processes states using only the lower 4 bits `OUT[3:0]`, and pads the upper bits to zero).

---

## Understanding the Data Path & Architecture

### Standardized 8-Bit Bus vs. 4-Bit Core Logic

In system design, it is standard practice to maintain a consistent bus width across all components to make routing easier later.

*   **Output Handling**: For a counter outputting a value like `00001010`, the circuit drives the entire 8-bit bus. The upper 4 bits `[7:4]` are held at zero by the internal logic, and the sequential core directly updates the active lower 4 bits `[3:0]` (`1010`).
*   **Synchronous Output**: Driving a 4-bit count requires mapping the state elements to the standardized 8-bit output bus to prevent integration errors with other 8-bit arithmetic components.

---

## Synchronous Counters

To navigate these schematics, it is important to understand the underlying hardware algorithms used for synchronous sequential logic.

### 🧠 Architecture Overview: How to Read This Schematic

A hardware synchronous counter updates all state bits simultaneously on the clock edge, avoiding the ripple effect of asynchronous designs. When reviewing this schematic, you can trace the data path through two distinct architectural stages:

**1. State Memory (The Flip-Flop Array)**

At the center of the schematic, you will see a matrix of standard Flip-Flops (such as T or JK types). In synchronous logic, these state elements share a common global clock, ensuring all bits transition simultaneously to form the next 4-bit count value.

**2. Next-State Logic (The AND/XOR Gate Array)**

Leading into the control pins of the flip-flops, you will find combinational logic gates. These gates process the current state of the counter to determine what the next state should be on the upcoming clock edge, ensuring the binary sequence increments correctly.
