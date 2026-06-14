# ADC Architecture

## 1. Architecture Overview

The ADC is modeled as a behavioral Real Number Model (RNM).

The ADC samples an analog input voltage and converts it into a 10-bit digital output code.

The model is intended for functional verification and system-level simulation.

## 2. Data Flow

analog_in
    ↓
Range Check
    ↓
Quantization
    ↓
Saturation Logic
    ↓
digital_out

## 3. Input Parameters

Input Voltage Range : 0V to 1V

Reference Voltage   : 1V

Resolution          : 10-bit

## 4. Output Parameters

Output Code Range : 0 to 1023

## 5. Quantization Equation

Code = (Vin / Vref) × (2^N - 1)

Where:

Vin  = Input Voltage

Vref = Reference Voltage

N    = ADC Resolution

## 6. Saturation Rules

If Vin < 0V

Output Code = 0

If Vin > 1V

Output Code = 1023

## 7. Sampling Method

The ADC samples analog_in on the positive edge of clk.

## 8. RNM Modeling

The analog input shall be represented using a SystemVerilog real datatype.

Example:

real analog_in;

The digital output shall be represented using a 10-bit logic vector.

Example:

logic [9:0] digital_out;
