# MIPS Processor VHDL Project

## Overview

This project involves the design and implementation of a MIPS processor using VHDL. The processor is modeled based on the MIPS architecture and includes components such as instruction memory, control unit, register file, ALU, and data memory. The project also includes a testbench for simulation purposes.

## Directory Structure

```
MIPS_Processor_Project/
│
├── src/
│   ├── alu_vhdl.vhd
│   ├── ALU_Control_VHDL.vhd
│   ├── control_unit_VHDL.vhd
│   ├── Instruction_Memory_VHDL.vhd
│   ├── MIPS_VHDL.vhd
│   ├── register_file_VHDL.vhd
│   └── sRam.vhd
│
├── testbench/
│   └── testbench_MIPS_VHDL.vhd
│
└── README.md
```

## Components

### ALU (Arithmetic Logic Unit)
- **File**: `alu_vhdl.vhd`
- Performs arithmetic and logical operations.

### ALU Control
- **File**: `ALU_Control_VHDL.vhd`
- Generates control signals for the ALU based on the instruction's function field.

### Control Unit
- **File**: `control_unit_VHDL.vhd`
- Generates control signals for other components based on the opcode.

### Instruction Memory
- **File**: `Instruction_Memory_VHDL.vhd`
- Stores and provides instructions to the processor.

### MIPS Processor
- **File**: `MIPS_VHDL.vhd`
- The top-level entity that integrates all the components to form the MIPS processor.

### Register File
- **File**: `register_file_VHDL.vhd`
- Contains the register set and provides read/write access to the registers.

### Data Memory (sRam)
- **File**: `sRam.vhd`
- Provides read/write access to data memory.

### Testbench
- **File**: `testbench_MIPS_VHDL.vhd`
- Used for simulating and verifying the functionality of the MIPS processor.

## Synthesis

To synthesize the design, use the following command in Vivado:

```tcl
synth_design -rtl -rtl_skip_mlo -name rtl_1
```

Ensure that the top module for synthesis is `testbench_MIPS_VHDL`.

## Issues and Fixes

### Width Mismatch in Assignment

If you encounter a width mismatch error during synthesis, ensure that the widths of the signals match. For example, in the case of the PC branch calculation, ensure proper resizing of the signals involved:

```vhdl
PC_branch <= std_logic_vector(resize(unsigned(pc_current) + unsigned(sign_ext_im(4 downto 0)), 32));
```

Alternatively, use a temporary signal to hold the result of the addition and then assign it to the target signal.

## Contributing

If you wish to contribute to this project, please fork the repository and submit a pull request with your changes. Ensure that your code adheres to the project's coding standards and is well-documented.

