# Multi-Mode Digital Modem Architecture

> A synthesizable Verilog-based RTL implementation of a configurable digital modem supporting **ASK, PSK, and FSK modulation and demodulation** with dynamic user-selectable operating modes. The design was functionally verified through Verilog simulation and validated on the **Digilent Arty A7 FPGA Development Board**.

![Language](https://img.shields.io/badge/Language-Verilog-blue)
![RTL](https://img.shields.io/badge/Design-RTL-success)
![FPGA](https://img.shields.io/badge/Hardware-Arty%20A7-green)


---

# Overview

This project implements a **unified digital modem architecture** capable of performing both modulation and demodulation using three fundamental digital modulation techniques:

* Amplitude Shift Keying (ASK)
* Phase Shift Keying (PSK)
* Frequency Shift Keying (FSK)

Unlike conventional implementations where each modulation technique is designed independently, this architecture integrates all three into a single configurable RTL design. The user dynamically selects the desired modulation scheme, after which the corresponding modulation and demodulation path is activated.

A **Direct Digital Synthesizer (DDS)** generates the carrier waveform, which is used by the selected modulation block to modulate the incoming message signal. The generated waveform is subsequently demodulated to recover the original binary message.

---

# Project Highlights

* Unified RTL architecture supporting ASK, PSK, and FSK
* User-selectable modulation scheme
* Integrated modulation and demodulation pipeline
* DDS-based carrier signal generation
* Modular and synthesizable Verilog implementation
* Functional verification using Verilog simulation
* Hardware validation on the Digilent Arty A7 FPGA Development Board
* Real-time waveform analysis using ChipScope Pro

---

# System Architecture

```text
                 Binary Message
                       │
                       ▼
              User Mode Selection
                       │
        ┌──────────────┼──────────────┐
        │              │              │
       ASK            PSK            FSK
        │              │              │
        └──────────────┼──────────────┘
                       │
                       ▼
          Direct Digital Synthesizer
                (Carrier Generation)
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

# Repository Structure

```text
multi-mode-digital-modem/

├── README.md
├── RTL/
│   Verilog source files
│
├── TB/
│   Functional verification testbenches
│
└── docs/
    Project documentation
```

---

# Design Methodology

The modem architecture consists of independent ASK, PSK, and FSK modulation/demodulation blocks integrated under a common control framework.

A user selection signal determines the active modulation scheme. The DDS generates the carrier waveform required by the selected modulation block, which modulates the incoming binary message. The resulting waveform is then passed to the corresponding demodulator, where the original message signal is recovered.

The modular RTL design allows additional modulation techniques to be integrated with minimal architectural changes.

---

# Verification & Hardware Validation

The complete modem architecture was verified through both RTL simulation and FPGA implementation.

### Functional Verification

* ✔ ASK modulation and demodulation
* ✔ PSK modulation and demodulation
* ✔ FSK modulation and demodulation
* ✔ Dynamic modulation selection
* ✔ End-to-end message recovery

### FPGA Validation

The synthesized design was implemented on the **Digilent Arty A7 FPGA Development Board**, where the modulation and demodulation schemes were successfully validated.

Waveforms were observed and analyzed using **ChipScope Pro**, confirming the correct operation of the selected modulation technique and successful recovery of the transmitted message.

---

# Applications

* Digital Communication Systems
* FPGA-Based Communication Prototypes
* Software Defined Radio (SDR) Prototyping
* Academic and Research Platforms
* Digital Modem IP Development

---

# Tools & Hardware

### Language

* Verilog HDL

### Hardware

* Digilent Arty A7 FPGA Development Board

### Development Tools

* Xilinx ISE
* ChipScope Pro

---

# Skills Demonstrated

* Verilog HDL
* RTL Design
* FPGA Prototyping
* Digital Communication Systems
* Digital Modulation Techniques
* Direct Digital Synthesis (DDS)
* Functional Verification
* FPGA Validation
* Hardware Debugging
* Modular RTL Design

---

# Future Enhancements

* QPSK and QAM implementation
* BER (Bit Error Rate) analysis
* Noise channel modeling
* Adaptive modulation techniques
* AXI-Stream interface integration


