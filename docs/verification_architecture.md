# Verification Architecture

## Components

1. Generator
   - Creates ADC transactions.

2. Driver
   - Drives analog input values to the DUT.

3. Monitor
   - Observes DUT outputs.

4. Scoreboard
   - Compares expected and actual outputs.

5. Environment
   - Connects all verification components.

## Verification Flow

Generator
    ↓
Driver
    ↓
ADC Interface
    ↓
ADC DUT
    ↓
Monitor
    ↓
Scoreboard

## Verification Goal

Verify:

- Reset behavior
- Minimum input conversion
- Maximum input conversion
- Mid-scale conversion
- Saturation behavior
