`timescale 1ns / 1ps
module RISCV_Top(
    input clk,
    input rst,
    output [31:0] ResultW 
);

    wire PCSrcE, RegWriteE, ResultSrcE, MemWriteE, BranchE, ALUSrcE;
    wire RegWriteM, ResultSrcM, MemWriteM;
    wire RegWriteW, ResultSrcW;
    wire [1:0] ForwardAE, ForwardBE;
    wire [3:0] ALUControlE;
    wire [4:0] RDW, RDE, RS1E, RS2E, RDM;
    wire [31:0] PCTargetE, InstrD, PCD, RD1E, RD2E, ImmExtE, PCE;
    wire [31:0] ALUResultW, ALUResultM, WriteDataM, ReadDataW;

    Instruction_Fetch_CC IF(
        .clk(clk),
        .rst(rst),
        .PCSrcE(PCSrcE),
        .PCTargetE(PCTargetE),
        .InstrD(InstrD),
        .PCD(PCD)
    );

    Instruction_Decode_CC ID(
        .clk(clk),
        .rst(rst),
        .RegWriteW(RegWriteW),
        .RDW(RDW),
        .PCD(PCD),
        .InstrD(InstrD),
        .ResultW(ResultW), 
        .RegWriteE(RegWriteE),
        .ResultSrcE(ResultSrcE),
        .MemWriteE(MemWriteE),
        .BranchE(BranchE),
        .ALUSrcE(ALUSrcE),
        .ALUControlE(ALUControlE),
        .RDE(RDE),
        .RS1E(RS1E),
        .RS2E(RS2E),
        .RD1E(RD1E),
        .RD2E(RD2E),
        .PCE(PCE),
        .ImmExtE(ImmExtE)
    );

    Execute_CC EX(
        .clk(clk),
        .rst(rst),
        .RegWriteE(RegWriteE),
        .ResultSrcE(ResultSrcE),
        .MemWriteE(MemWriteE),
        .BranchE(BranchE),
        .ALUSrcE(ALUSrcE),
        .ForwardAE(ForwardAE),
        .ForwardBE(ForwardBE),
        .ALUControlE(ALUControlE),
        .RDE(RDE),
        .RD1E(RD1E),
        .RD2E(RD2E),
        .ImmExtE(ImmExtE),
        .PCE(PCE),
        .ResultW(ResultW),
        .RegWriteM(RegWriteM),
        .ResultSrcM(ResultSrcM),
        .MemWriteM(MemWriteM),
        .PCSrcE(PCSrcE),
        .RDM(RDM),
        .WriteDataM(WriteDataM),
        .PCTargetE(PCTargetE),
        .ALUResultM(ALUResultM)
    );

    Memory_Acess_CC MEM(
        .clk(clk),
        .rst(rst),
        .RegWriteM(RegWriteM),
        .ResultSrcM(ResultSrcM),
        .MemWriteM(MemWriteM),
        .RDM(RDM),
        .ALUResultM(ALUResultM),
        .WriteDataM(WriteDataM),
        .RegWriteW(RegWriteW),
        .ResultSrcW(ResultSrcW),
        .ALUResultW(ALUResultW),
        .ReadDataW(ReadDataW),
        .RDW(RDW)
    );

    Writeback_CC WB(
        .ResultSrcW(ResultSrcW),
        .ALUResultW(ALUResultW),
        .ReadDataW(ReadDataW),
        .ResultW(ResultW)
    );

    Hazard_Unit FB(
        .rst(rst),
        .RegWriteM(RegWriteM),
        .RegWriteW(RegWriteW),
        .RS1E(RS1E),
        .RS2E(RS2E),
        .RDM(RDM),
        .RDW(RDW),
        .ForwardAE(ForwardAE),
        .ForwardBE(ForwardBE)
    );

endmodule



