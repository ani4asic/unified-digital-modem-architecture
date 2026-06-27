# unified-digital-modem-architecture
# Multi-Mode Digital Modem Architecture

> A synthesizable Verilog-based RTL implementation of a configurable digital modem supporting **ASK, PSK, and FSK modulation and demodulation** with user-selectable operating modes.

![Language](https://img.shields.io/badge/Language-Verilog-blue)
![RTL](https://img.shields.io/badge/Design-RTL-success)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## Overview

This project presents a **unified digital modem architecture** capable of performing both modulation and demodulation using three widely adopted digital modulation techniques:

* Amplitude Shift Keying (ASK)
* Phase Shift Keying (PSK)
* Frequency Shift Keying (FSK)

A user-selectable control input enables dynamic switching between modulation schemes, allowing a single RTL implementation to support multiple communication modes. The architecture integrates modulation and demodulation into a common framework, enabling end-to-end recovery of the transmitted message signal.

---

## Project Highlights

* Unified RTL architecture supporting ASK, PSK, and FSK
* User-selectable modulation scheme
* Integrated modulation and demodulation pipeline
* DDS-based carrier signal generation
* Modular and synthesizable Verilog implementation
* Functional verification through Verilog simulation

---

## System Architecture

```text
                 Message Signal
                       │
                       ▼
              User Modulation Selection
                       │
         ┌─────────────┼─────────────┐
         │             │             │
        ASK           PSK           FSK
         │             │             │
         └─────────────┼─────────────┘
                       │
                       ▼
            Unified Modulator (RTL)
                       │
                 Modulated Signal
                       │
                       ▼
           Unified Demodulator (RTL)
                       │
                       ▼
            Recovered Message Signal
```

---

## Repository Structure

```text
Multi-Mode-Digital-Modem/

├── README.md
├── RTL/
│   Verilog source files
│
├── TB/
│   Testbench files
│
└── docs/
    Project documentation
```

---

## Design Methodology

The modem architecture consists of individual ASK, PSK, and FSK modulation/demodulation modules integrated under a common control framework.

A user selection signal determines the active modulation scheme. Based on the selected mode, the corresponding modulator processes the incoming binary message using a DDS-generated carrier signal. The resulting waveform is then passed through the matching demodulator to reconstruct the original message.

The modular RTL architecture enables straightforward extension to additional modulation schemes while maintaining a common interface.

---

## Verification

The design was functionally verified using Verilog simulation.

Verification included:

* ✔ ASK Modulation and Demodulation
* ✔ PSK Modulation and Demodulation
* ✔ FSK Modulation and Demodulation
* ✔ User-controlled mode selection
* ✔ End-to-end message recovery

The recovered output matched the transmitted message for all supported modulation schemes.

---

## Applications

* Digital Communication Systems
* FPGA Communication Prototypes
* Software Defined Radio (SDR) Prototyping
* Communication System Education and Research

---

## Skills Demonstrated

* Verilog HDL
* RTL Design
* Digital Communication Systems
* Digital Modulation Techniques
* Direct Digital Synthesis (DDS)
* Functional Verification
* Modular Hardware Design

---

## Future Enhancements

* QPSK and QAM implementation
* BER (Bit Error Rate) analysis
* Noise channel modeling
* FPGA implementation and hardware validation
* AXI-Stream interface support

---

## License

This repository is intended for educational and research purposes.
