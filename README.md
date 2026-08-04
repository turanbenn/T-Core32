# RISC-V 32-bit FPGA Processor Core

A custom 32-bit RISC-V compatible processor core developed in VHDL for FPGA platforms.

The purpose of this project is to design a lightweight processor architecture from scratch and create a foundation for FPGA-based applications such as embedded systems, custom hardware projects, and simple 2D graphics/game engine experiments.

## Project Status

🚧 Development in progress

Currently implemented:

- [x] 32-bit ALU design
- [x] Arithmetic operations
- [x] Logical operations
- [x] Shift operations
- [x] Comparison operations
- [ ] Register File
- [ ] Instruction Decoder
- [ ] Program Counter
- [ ] Instruction Memory
- [ ] Data Memory
- [ ] Complete RISC-V CPU execution

## Features

### ALU Operations

The current ALU supports:

| Operation | Control Code |
|-----------|--------------|
| ADD | 00000 |
| SUB | 00001 |
| AND | 00010 |
| OR | 00011 |
| XOR | 00100 |
| NOR | 00101 |
| SLL | 00110 |
| SRL | 00111 |
| SRA | 01000 |
| SLT | 01001 |
| SLTU | 01010 |

The ALU supports 32-bit data processing and includes a zero flag output for conditional operations.

## Architecture Overview

The processor is designed around a simple RISC-V style architecture.

          Instruction Memory
                 |
                 v
         Instruction Decoder
                 |
      +----------+----------+
      |                     |
      v                     v
Register File -----------> ALU
      |
      v
  Data Memory


The ALU receives two operands and an operation control signal. According to the control signal, it performs the selected arithmetic or logical operation and returns the result.

## Hardware Target

Designed for FPGA implementation.

Target devices:

- Sipeed Tang Nano 9K
- Gowin FPGA devices
- Xilinx FPGA devices

## Technologies Used

- VHDL
- FPGA Digital Design
- RISC-V Instruction Set Architecture concepts
- Computer Architecture
- Hardware Description Languages

## ALU Example

Example operation:

a = 10
b = 5

alu_ctrl = 00000

Operation:
ADD

result = 15
zero = 0


## Future Goals

Planned improvements:

- Complete RV32I instruction support
- Implement 32 general purpose registers (x0-x31)
- Create instruction decoder
- Add program counter
- Add memory interface
- Build a complete RISC-V processor core
- Add custom instructions for 2D graphics processing
- Create FPGA-based game engine features


## Author

Turan

Custom FPGA Processor Design Project

## License

This project is created for learning, experimentation, and personal hardware development.

