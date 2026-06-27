# RTL Design and Verification of an 8-Point FFT/IFFT Processor using Verilog HDL

## Overview

This project presents the RTL design and functional verification of an 8-point Fast Fourier Transform (FFT) and Inverse Fast Fourier Transform (IFFT) processor using Verilog HDL. The implementation demonstrates the hardware realization of FFT/IFFT algorithms for efficient digital signal processing applications.

The processor was verified through simulation using Icarus Verilog, and the generated outputs were compared with MATLAB-generated reference results to validate functional correctness.

---

## Objectives

* Design an 8-point FFT processor using Verilog HDL.
* Implement the corresponding 8-point IFFT processor.
* Verify functionality using Verilog testbenches.
* Analyze simulation waveforms.
* Validate FFT/IFFT outputs against MATLAB reference results.

---

## Repository Structure

```text
.
├── FFT/
│   ├── fft.v
│   ├── fft_tb.v
│   └── Bits input format.jpeg
│
├── IFFT/
│   ├── ifft.v
│   ├── ifft_tb.v
│   └── Bits input format.jpeg
│
├── README.md
└── LICENSE
```

---

## Features

* RTL implementation of an 8-point FFT
* RTL implementation of an 8-point IFFT
* Functional verification using Verilog testbenches
* Waveform-based simulation analysis
* MATLAB result comparison
* Modular Verilog design

---

## Development Tools

* Verilog HDL
* Icarus Verilog (iVerilog)
* GTKWave
* MATLAB
* Digital Signal Processing Concepts

---

## Methodology

1. Design the FFT architecture using Verilog HDL.
2. Implement the IFFT architecture using Verilog HDL.
3. Develop separate testbenches for functional verification.
4. Simulate the design using Icarus Verilog.
5. Analyze simulation waveforms using GTKWave.
6. Compare simulation outputs with MATLAB-generated FFT/IFFT results.
7. Verify the correctness of the implemented architecture.

---

## Applications

* Digital Signal Processing (DSP)
* OFDM Communication Systems
* Image Processing
* Audio Processing
* Wireless Communication
* FPGA and ASIC Design
* Software Defined Radio (SDR)

---

## Results

The implemented FFT and IFFT processors were successfully simulated and functionally verified. Simulation outputs were analyzed using waveform viewers and validated against MATLAB reference calculations, demonstrating correct frequency-domain and time-domain transformations.

---

## Future Improvements

* Parameterized N-point FFT/IFFT implementation
* Fixed-point arithmetic optimization
* Pipelined FFT architecture
* FPGA implementation
* Performance optimization for high-speed DSP applications

---

## Skills Demonstrated

* Verilog HDL
* RTL Design
* Digital Signal Processing
* Functional Verification
* Testbench Development
* MATLAB Validation
* Waveform Analysis
* Digital System Design

---

## Author

**Shivam Kumar**

B.Tech, Electronics and Communication Engineering

Indian Institute of Technology (ISM) Dhanbad
