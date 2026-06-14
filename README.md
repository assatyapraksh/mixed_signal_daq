# Mixed-Signal Data Acquisition System Verification

## Overview

This project implements and verifies a Mixed-Signal Data Acquisition System using SystemVerilog Real Number Modeling (RNM).

The system consists of:

* 10-bit ADC RNM Model
* 10-bit DAC RNM Model
* ADC-DAC Loopback Verification
* Directed Verification
* Random Verification
* Functional Coverage
* Scoreboard-Based Checking

## Project Architecture

analog_in
→ ADC
→ digital_code
→ DAC
→ analog_out

## Features

* Real Number Modeling (RNM)
* Self-Checking Testbenches
* Functional Coverage
* Randomized Verification
* Waveform Analysis using GTKWave
* Verification Signoff Report

## Verification Results

### ADC Verification

PASS = 7

FAIL = 0

### DAC Verification

PASS = 5

FAIL = 0

### Loopback Verification

PASS = 5

FAIL = 0

### Random Verification

PASS = 100

FAIL = 0

## Tools Used

* SystemVerilog
* Icarus Verilog
* GTKWave
* Git
* GitHub
* VS Code
* WSL Ubuntu

## Author

Satya Prakash
ECE Student

