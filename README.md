# Table of Contents

- [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Features](#features)
  - [Microarchitecture](#microarchitecture)
  - [Tools Used](#tools-used)
  - [Design Steps](#design-steps)
  - [Hazard Handling](#hazard-handling)
  - [RTL View](#rtl-view)

---

## Introduction
This archive contains the files of the RISC - V 32-bit core. This was done as part of an assignment at the preThesis group of the computer engineering department.

## Features
- 32-bit Instruction Format
- Implemented some Instructions of the RV32I Core
- 5 Stage Pipeline Design
- Hazard Handling

## Microarchitecture
Diagram was created using Visio software.
<img width="1349" height="858" alt="Screenshot 2025-08-20 212233" src="https://github.com/user-attachments/assets/d1964d2b-2dd8-4664-9add-23d5e17456a6" />

## Tools Used
- Vivado Design Suite
- VS Code
- Modelsim

## Design Steps
- Implement Instruction Fetch (IF) stage with PC logic and Instruction Memory.
- Implement Instruction Decode (ID) stage with Register File and Control Unit. 
- Implement Execute (EX) stage with ALU and branch logic. 
- Implement Memory Access (MEM) stage with Data Memory. 
- Implement Write Back (WB) stage to update registers.
- Add Forwarding and Hazard Unit to handle data and control hazards.
- Connect all pipeline registers (IF/ID, ID/EX, EX/MEM, MEM/WB) and verify pipeline operation.
  
## Hazard Handling
Occurs when an instruction depends on the results of the previous instruction which is not yet completed.
- Data Hazards
  - Forwarding - Forward the result from the Memory Stage and the WriteBack stage to the Execute stage.
  - Stalling ( for load word ) - Data read from memory is available only at the end of clock cycle. So, we stall the next instructions and forward the memory data from WriteBack stage.
- Control Hazards
  - Flushing - Whenever the decision is made to take a branch in Execute stage, flush the next two instructions (Decode and Fetch Stages).

 ## RTL View
 <img width="1407" height="701" alt="Screenshot 2025-08-20 230421" src="https://github.com/user-attachments/assets/288a4fb3-70c7-4c52-aa49-544fb6f33530" />

