# Vending Machine Controller (Verilog)

## Introduction

A **Vending Machine Controller** is a digital system that dispenses a product based on user input, typically represented by inserted coins. Such systems are commonly implemented using a **Finite State Machine (FSM)** to track accumulated credit and control product delivery.

In this project, a **vending machine controller** is implemented using **Verilog HDL**. The design processes a 2-bit coin input, updates its internal state synchronously with the clock, and generates an output signal when the required condition for dispensing is met.

---

## Vending Machine Operation and Timing

The vending machine operates synchronously with the system clock.  
At every rising edge of the clock:

- The current state is updated based on the coin input
- The FSM moves between predefined states
- The output signal is generated based on the current state

A reset signal is provided to initialize the machine to its idle state.

---

## State and Coin Interpretation

The vending machine FSM consists of four states:

- **State A**: Initial state (no valid coin detected)
- **State B**: Partial credit received
- **State C**: Dispense-ready state
- **State D**: Dispense-ready state

The `coin` input is a 2-bit signal interpreted as:

- `00` → No coin
- `01` → First type of coin
- `10` → Second type of coin
- Other values are ignored or reset behavior is applied

---

## State Transition Flow

### State Transition Behavior

- **State A**:
  - `coin = 00` → Stay in State A
  - `coin = 01` → Move to State B
  - `coin = 10` → Move to State C

- **State B**:
  - `coin = 00` → Stay in State B
  - `coin = 01` → Move to State C
  - `coin = 10` → Move to State D

- **State C**:
  - Remains in State C

- **State D**:
  - Remains in State D

States **C** and **D** represent successful conditions for product dispensing.

---

## Design Overview

The vending machine controller is implemented using the following components:

- **Finite State Machine (FSM)**
- **Combinational Next-State Logic**
- **Sequential State Register**
- **Output Control Logic**

The FSM tracks the progression of coin inputs and determines when to activate the output.

---

## Vending Machine Module

### Interface Signals

- **clk**  
  System clock input

- **reset**  
  Asynchronous active-high reset

- **coin [1:0]**  
  Coin input signal

- **state**  
  Current FSM state

- **newstate**  
  Next FSM state

- **out**  
  Output signal indicating product dispense condition

---

## FSM Operation

- The next state (`newstate`) is determined using combinational logic based on the current state and coin input.
- On every rising edge of the clock:
  - The FSM updates the current state to `newstate`
- When reset is asserted:
  - The FSM returns to the initial state (State A)

---

## Output Logic

- The output signal `out` is asserted when:
  - The FSM is in **State C** or **State D**
- For all other states:
  - The output remains low

This logic ensures that the product is dispensed only when the required state is reached.

---

## Testbench Overview

A Verilog testbench is used to verify the vending machine controller behavior.

### Testbench Features

- Generates a periodic clock signal
- Applies reset at different points during simulation
- Applies different coin input sequences
- Observes FSM states and output signal

The testbench confirms correct state transitions and output activation.

---

## Overall System Operation

1. The system starts in the initial state after reset.
2. Coin inputs are applied sequentially.
3. The FSM transitions through intermediate states.
4. When State C or D is reached, the output is asserted.
5. Reset returns the system to the initial state.

This confirms correct vending machine control behavior.

---

## Summary

This project demonstrates a **vending machine controller implemented using a Finite State Machine** in Verilog. The design correctly processes coin inputs, tracks system state, and activates an output when dispensing conditions are met.

The FSM-based approach makes the design easy to understand, simulate, and extend for more complex vending machine applications.

<img width="1580" height="818" alt="Screenshot 2025-12-17 171205" src="https://github.com/user-attachments/assets/b874c59b-3b7f-4f44-abe1-17fd3cf9a57f" />
