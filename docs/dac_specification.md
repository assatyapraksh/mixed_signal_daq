# DAC Specification

## 1. Overview

The DAC (Digital to Analog Converter) converts a 10-bit digital input code into an analog output voltage.

The DAC is the second block in the Mixed-Signal Data Acquisition System.

## 2. Purpose

The DAC converts digital data into an equivalent analog voltage.

## 3. DAC Configuration

Resolution            : 10-bit

Reference Voltage     : 1.0V

Input Code Range      : 0 to 1023

Output Voltage Range  : 0V to 1V

Update Type           : Clocked

Update Edge           : Positive Edge

## 4. Inputs

clk

rst_n

digital_in[9:0]

## 5. Outputs

analog_out

## 6. Reset Behavior

When rst_n = 0

analog_out shall become 0.0V

## 7. Conversion Equation

Vout = (Code / 1023) × Vref

## 8. Conversion Examples

0      -> 0.000V

255    -> 0.249V

511    -> 0.499V

767    -> 0.749V

1023   -> 1.000V

## 9. Verification Requirements

1. Reset Verification
2. Minimum Code Verification
3. Maximum Code Verification
4. Mid-Scale Verification
5. Random Code Verification
6. Functional Coverage
