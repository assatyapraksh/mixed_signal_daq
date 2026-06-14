# ADC Specification

## 1. Overview

The ADC (Analog to Digital Converter) converts an analog input voltage into a 10-bit digital output code.

The ADC is the first block in the Mixed-Signal Data Acquisition System.

## 2. Purpose

The purpose of the ADC is to convert analog sensor information into digital data that can be processed by digital hardware.

## 3. ADC Configuration

Resolution      : 10-bit

Reference Voltage (Vref) : 1.0V

Input Voltage Range      : 0V to 1V

Output Code Range        : 0 to 1023

Sampling Type            : Clocked

Sampling Edge            : Positive Edge

## 4. Inputs

clk

rst_n

analog_in

## 5. Outputs

digital_out[9:0]

## 6. Reset Behavior

When rst_n = 0

digital_out shall become 0.

## 7. Conversion Examples

0.00V -> 0

0.25V -> 255

0.50V -> 511

0.75V -> 767

1.00V -> 1023
## 8. Verification Requirements

The following functionality shall be verified:

1. Reset Verification

   - When rst_n is asserted, digital_out shall become 0.

2. Minimum Input Verification

   - analog_in = 0V shall produce digital_out = 0.

3. Maximum Input Verification

   - analog_in = 1V shall produce digital_out = 1023.

4. Mid-Scale Verification

   - analog_in = 0.5V shall produce digital_out approximately equal to 511.

5. Random Input Verification

   - Random analog input values shall be applied across the full input range.

6. Boundary Verification

   - Verify behavior at 0V.
   - Verify behavior at 1V.

7. Functional Coverage

   - Cover low-range inputs.
   - Cover mid-range inputs.
   - Cover high-range inputs.
