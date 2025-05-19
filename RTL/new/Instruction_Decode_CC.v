`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:46:41 04/20/2024 
// Design Name: 
// Module Name:    Instruction_Decode_CC
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Instruction_Decode_CC(
    input clk,rst, 
    input RegWriteW,
    input [4:0] RDW, 
    input [31:0] InstrD, 
    input [31:0] ResultW,
    input [31:0] PCD,
    
    output BranchE, ResultSrcE, MemWriteE, RegWriteE, ALUSrcE,
    output [3:0] ALUControlE,
    output [4:0] RS1E, 
    output [4:0] RS2E,
    output [4:0] RDE, 
    output [31:0] RD1E, 
    output [31:0] RD2E, 
    output [31:0] ImmExtE,
    output [31:0] PCE
);

    wire BranchD, ResultSrcD, MemWriteD, RegWriteD,ALUSrcD;
    wire [1:0] ImmSrcD;
    wire [3:0] ALUControlD;
    wire [31:0] RD1D, RD2D, ImmExtD;

    Control_Unit CU(
        .Op(InstrD[6:0]), 
        .funct7(InstrD[31:25]), 
        .funct3(InstrD[14:12]), 
        .RegWrite(RegWriteD), 
        .ALUSrc(ALUSrcD), 
        .MemWrite(MemWriteD), 
        .ResultSrc(ResultSrcD), 
        .Branch(BranchD), 
        .ImmSrc(ImmSrcD), 
        .ALUControl(ALUControlD)
    );

    Register_File RegFile (
        .clk(clk), 
        .rst(rst), 
        .WE(RegWriteW), 
        .A1(InstrD[19:15]), 
        .A2(InstrD[24:20]), 
        .A3(RDW), 
        .WD(ResultW), 
        .RD1(RD1D), 
        .RD2(RD2D)
    );

    Extend EXT ( 
        .In(InstrD), 
        .ImmSrc(ImmSrcD), 
        .Imm_Ext(ImmExtD)
    );

    REG_2 REG_IDEX (
        .clk(clk),
        .rst(rst),
        .BranchD(BranchD),
        .ResultSrcD(ResultSrcD),
        .MemWriteD(MemWriteD),
        .RegWriteD(RegWriteD),
        .ALUSrcD(ALUSrcD),
        .ALUControlD(ALUControlD),
        .RD1D(RD1D),
        .RD2D(RD2D),
        .ImmExtD(ImmExtD),
        .PCD(PCD),
        .InstrD(InstrD),
        .BranchE(BranchE),
        .ResultSrcE(ResultSrcE),
        .MemWriteE(MemWriteE),
        .RegWriteE(RegWriteE),
        .ALUSrcE(ALUSrcE),
        .ALUControlE(ALUControlE),
        .RS1E(RS1E),
        .RS2E(RS2E),
        .RDE(RDE),
        .RD1E(RD1E),
        .RD2E(RD2E),
        .ImmExtE(ImmExtE),
        .PCE(PCE)
    );

endmodule
