# SystemVerilog Simulation Project

This repository contains  assignment number 1 in curse Digital Systems And Comp Structure in the Technion,
SystemVerilog implementations and templates for digital logic components, including basic logic gates, multiplexers, full adder/subtractor, and arithmetic logic units (ALUs).

## Project Overview

This project is designed for learning and implementing digital logic circuits using SystemVerilog. It includes both completed implementations and template modules for educational purposes.

## Repository Structure

```
.
├── Tests./                  # Basic logic gate implementations
│   ├── NAND2.sv            # 2-input NAND gate
│   ├── OR2.sv              # 2-input OR gate
│   └── XNOR2.sv            # 2-input XNOR gate
├── alu1bit.sv              # 1-bit ALU template
├── alu64bit.sv             # 64-bit ALU template
├── alu64bit_test.sv        # Test bench for 64-bit ALU
├── fas.sv                  # Full Adder/Subtractor template
├── fas_test.sv             # Test bench for Full Adder/Subtractor
├── libtest.sv              # Example test bench for logic gates
├── mux2.sv                 # 2-to-1 multiplexer (implemented)
├── mux4.sv                 # 4-to-1 multiplexer (implemented)
├── mux4_test.sv            # Test bench for 4-to-1 multiplexer
├── Work/                   # Workspace directory
└── Untitled Diagram.drawio.png  # Circuit diagram
```

## Components

### Implemented Modules

#### 1. Basic Logic Gates (Tests/ directory)
- **NAND2**: 2-input NAND gate with configurable propagation delays
- **OR2**: 2-input OR gate with configurable propagation delays
- **XNOR2**: 2-input XNOR gate with configurable propagation delays

All gates support parameterizable timing delays:
- `Tpdlh`: Low-to-high propagation delay (default: 1 time unit)
- `Tpdhl`: High-to-low propagation delay (default: 1 time unit)

#### 2. 2-to-1 Multiplexer (mux2.sv)
A fully implemented 2-to-1 multiplexer built using NAND and OR gates from the basic gate library.

**Ports:**
- `d0`: Data input 0
- `d1`: Data input 1
- `sel`: Select signal
- `z`: Output

**Implementation:** Uses NAND-based logic for robust gate-level design.

#### 3. 4-to-1 Multiplexer (mux4.sv)
A hierarchical implementation using three 2-to-1 multiplexers.

**Ports:**
- `d0`, `d1`, `d2`, `d3`: Data inputs
- `sel[1:0]`: 2-bit select signal
- `z`: Output

**Architecture:** Two-stage design using mux2 modules.

### Template Modules (To Be Implemented)

#### 1. Full Adder/Subtractor (fas.sv)
Template for a configurable adder/subtractor circuit.

**Ports:**
- `a`, `b`: Input operands
- `cin`: Carry input
- `a_ns`: Add/not subtract control signal
- `s`: Sum/difference output
- `cout`: Carry output

#### 2. 1-bit ALU (alu1bit.sv)
Template for a 1-bit arithmetic logic unit.

**Ports:**
- `a`, `b`: Input operands
- `cin`: Carry input
- `op[1:0]`: 2-bit operation selector
- `s`: Result output
- `cout`: Carry output

#### 3. 64-bit ALU (alu64bit.sv)
Template for a 64-bit arithmetic logic unit.

**Ports:**
- `a[63:0]`, `b[63:0]`: 64-bit input operands
- `cin`: Carry input
- `op[1:0]`: 2-bit operation selector
- `s[63:0]`: 64-bit result output
- `cout`: Carry output

## Test Benches

The repository includes test bench templates for validating the implementations:

- **libtest.sv**: Example test bench demonstrating how to instantiate and test basic logic gates
- **mux4_test.sv**: Test bench template for the 4-to-1 multiplexer
- **fas_test.sv**: Test bench template for the Full Adder/Subtractor
- **alu64bit_test.sv**: Test bench template for the 64-bit ALU

### Example Test Bench Usage (libtest.sv)

The `libtest.sv` file demonstrates:
- Signal declaration for gate inputs and outputs
- Stimulus generation using `initial` blocks
- Gate instantiation with custom timing parameters
- Time-based value changes using delay statements (`#10`)

## Getting Started

### Prerequisites
- SystemVerilog simulator (e.g., ModelSim, QuestaSim, VCS, or Verilator)
- Basic knowledge of digital logic design
- Understanding of SystemVerilog syntax

### Running Simulations

1. Compile the required modules:
   ```bash
   # Example using ModelSim/QuestaSim
   vlog Tests./NAND2.sv Tests./OR2.sv Tests./XNOR2.sv
   vlog mux2.sv mux4.sv
   vlog libtest.sv
   ```

2. Run simulation:
   ```bash
   vsim -c libtest -do "run -all; quit"
   ```

3. View waveforms (if using GUI mode):
   ```bash
   vsim libtest
   # Add signals to wave window and run simulation
   ```

## Design Approach

### Hierarchical Design
The project demonstrates hierarchical design methodology:
- Basic gates are the foundation (NAND2, OR2, XNOR2)
- More complex components (mux2) are built from basic gates
- Higher-level modules (mux4) use lower-level components
- ALUs can be constructed using adders and multiplexers

### Timing Modeling
All gate modules include propagation delay parameters for realistic timing simulation, allowing for:
- Accurate timing analysis
- Delay customization per instance
- Race condition detection

## Contributing

When implementing the template modules:
1. Follow the existing coding style
2. Include appropriate comments
3. Add comprehensive test benches
4. Verify timing behavior
5. Test corner cases

## License

This project is intended for educational purposes.

## Author

ErezWeinberg

## Notes

- Template modules (marked with "Put your code here") are meant to be filled in as learning exercises
- The diagram file (`Untitled Diagram.drawio.png`) provides visual reference for the circuit designs
- All timing delays are in arbitrary time units as defined by the simulator
