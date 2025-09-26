# FIR Filter Hardware Implementation

A project repository for designing, simulating, and implementing a Finite Impulse Response (FIR) filter in hardware. This includes filter design, coefficient generation, simulation, and hardware description (Verilog / HDL) implementation.

---

## Table of Contents

- [Introduction](#introduction)  
- [Features](#features)  
- [Repository Structure](#repository-structure)  
- [Requirements / Dependencies](#requirements--dependencies)  
- [Usage](#usage)  
  - [Designing the Filter](#designing-the-filter)  
  - [Simulation](#simulation)  
  - [Hardware / Verilog Implementation](#hardware--verilog-implementation)  
- [Files Description](#files-description)  
- [How to Build / Run](#how-to-build--run)  
- [References](#references)  

---

## Introduction

This project demonstrates a full flow of FIR filter implementation in hardware:

1. Design and compute the FIR coefficients (floating or fixed point).  
2. Simulate in a high-level environment (e.g. MATLAB, SciLab, Python).  
3. Translate to hardware description (Verilog / VHDL) for synthesis and implementation.  
4. Verify correct operation using test benches, plots, and hardware tools.

---

## Features

- Support for floating and fixed‑point coefficient generation  
- Simulation scripts (Python, SciLab)  
- Verilog / HDL modules for FIR filter  
- Test benches and verification  
- Plots and analysis of frequency response, impulse response, error  

---

## Repository Structure

Here is a sample layout based on what is present:

repository:
  name: FIR-Filter-hardware-Implementation
  structure:
    FIR_Filter/: "HDL / Verilog source files"
    Plots/: "Output plots (frequency response, impulse response, error curves)"
    Python_code/: "Python scripts for filter design, coefficient generation, and testing"
    Chapter_5_Design_of_FIR_Filters.pdf: "Reference chapter on FIR filter design"
    Coefficient_float.txt: "List of generated floating-point coefficients"
    FIR_Docs.docx: "Documentation on FIR filter theory and project notes"
    FIR_SCILAB.sci: "SciLab script for FIR filter design and analysis"
    InTech_Digital_FIR_Hilbert_Transformers.pdf: "Research paper: Fundamentals and efficient design methods"
    fir-filter-design.pdf: "Additional reference on FIR filter design"
    other_references: "Miscellaneous reference and documentation files"



---

## Requirements / Dependencies

To use or extend this repo, you will need:

- Python (with libraries such as `numpy`, `matplotlib`, etc.)  
- SciLab  
- Verilog / HDL toolchain (e.g. Icarus Verilog, ModelSim, or your FPGA vendor tools)  
- Synthesis / implementation tools (if targeting FPGA)  
- Plotting tools (via Python or MATLAB)  

---

## Usage

### Designing the Filter

1. Use the scripts in `Python_code/` to specify filter specifications (e.g. passband, stopband, order).  
2. Generate filter coefficients (floating or fixed).  
3. Save coefficients (e.g. `Coefficient_float.txt`).

### Simulation

1. Use the generated coefficients in simulation scripts (Python or SciLab).  
2. Plot frequency response, impulse response, error curves.  
3. Compare ideal and quantized filters.

### Hardware / Verilog Implementation

1. Write HDL (Verilog) modules under `FIR_Filter/`.  
2. Create test benches to feed input and coefficients and verify output.  
3. Synthesize and map to hardware (FPGA or ASIC) if desired.  
4. Validate output matches expected.

---

## Files Description

Here’s a brief on some of the major files/folders:

| File / Folder | Description |
|----------------|-------------|
| `FIR_Filter/` | Verilog (or HDL) modules for filter, multiplier, accumulator, etc. |
| `Python_code/` | Scripts to design the filter, generate coefficients, and test signals |
| `Plots/` | Generated plots (frequency, impulse responses, error) |
| `Coefficient_float.txt` | List of floating point filter coefficients |
| `FIR_Docs.docx` | Documentation about filter theory / implementation |
| `FIR_SCILAB.sci` | SciLab script for filter design / testing |
| *Various PDF references* | Reference papers, texts on FIR filter design and Hilbert transforms |

---

## How to Build / Run

Below is a generic outline — adjust according to your environment:

```bash
# 1. Generate coefficients
cd Python_code/
python design_fir.py   # or similar script name

# 2. Simulate / plot
python simulate.py

# 3. Run HDL test benches / simulate Verilog
cd ../FIR_Filter/
iverilog -o fir_tb fir_filter.v fir_tb.v
vvp fir_tb

# 4. (Optional) Synthesize / implement to hardware (FPGA vendor commands)
# e.g. for Xilinx Vivado:
vivado -mode batch -source build_fir.tcl
```
## References

- “Digital FIR filter design” (PDFs included)
- InTech – Digital FIR Hilbert Transformers: Fundamentals and Efficient Design Methods
- Course materials / textbooks
- Online FIR design tutorials
