transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -incr -v2k5 -l xil_defaultlib \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/ALU.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/ALU_Decoder.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Adder.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Control_Unit.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Data_Memory.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Division.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Execute_CC.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Extend.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Hazard_Unit.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Instruction_Decode_CC.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Instruction_Fetch_CC.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Instruction_Memory.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Main_Decoder.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Memory_Access_CC.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Mux2.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Mux3.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Program_Counter.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/REG_1.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/REG_2.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/REG_3.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/REG_4.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/RISCV_Top.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Register_File.v" \
"../../../RISC-V 32bit pipeline.srcs/sources_1/new/Writeback_CC.v" \
"../../../RISC-V 32bit pipeline.srcs/sim_1/new/RISCV_Top_tb.v" \


vlog -work xil_defaultlib \
"glbl.v"

