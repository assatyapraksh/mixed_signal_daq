# DAC Architecture

## 1. Architecture Overview

The DAC is modeled as a behavioral Real Number Model (RNM).

The DAC converts a 10-bit digital input code into an analog output voltage.

The model is intended for functional verification and system-level simulation.

## 2. Data Flow

digital_in
    ↓
Range Check
    ↓
Scaling Logic
    ↓
analog_out

## 3. Input Parameters

Input Code Range : 0 to 1023

Reference Voltage : 1.0V

Resolution : 10-bit

## 4. Output Parameters

Output Voltage Range : 0V to 1V

## 5. Conversion Equation

Vout = (Code / 1023) × Vref

Where:

Code = Digital Input

Vref = Reference Voltage

## 6. Saturation Rules

If Code < 0

Output Voltage = 0V

If Code > 1023

Output Voltage = 1.0V

## 7. Update Method

The DAC updates analog_out on the positive edge of clk.

## 8. RNM Modeling

The digital input shall be represented using:

logic [9:0] digital_in;

The analog output shall be represented using:

real analog_out;
