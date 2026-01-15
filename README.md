# SPI-Master-Controller
# SPI Master Controller (Verilog, FPGA)

This project implements a custom SPI master in Verilog to communicate with a
TMP121 temperature sensor using an FPGA-based system.

## Features
- SPI clock generation from 16 MHz system clock
- Chip-select timing control
- Edge-based sampling of MISO
- Shift-register-based data reception
- Stable output data latching

## Verification
- RTL testbench verifies timing, edge alignment, and data correctness
- Simulation performed prior to FPGA deployment

## Hardware
- FPGA: Xilinx Spartan-3E
- Peripheral: TMP121 temperature sensor
- Tools: Xilinx ISE, JTAG

## Communication Details
- SPI clock: 4 MHz
- Transfer length: 64 cycles
- Data width: 13 bits

## Learning Outcomes
- Peripheral bring-up
- Timing-critical digital design
- Hardware–software interaction
- Verification-first development
