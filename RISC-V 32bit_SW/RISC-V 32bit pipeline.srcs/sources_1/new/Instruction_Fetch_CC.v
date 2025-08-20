`timescale 1ns / 1ps

module Instruction_Fetch_CC(  
    input clk, rst, 
    input PCSrcE,
    input [31:0] PCTargetE,
    
    output [31:0] InstrD, 
    output [31:0] PCD
); 
    wire [31:0] PC_F, PCF, PCPlus4F, InstrF;

    Mux2 MUX_F(
        .a(PCPlus4F), 
        .b(PCTargetE), 
        .s(PCSrcE), 
        .c(PC_F)
    );

    Program_Counter PC(
        .clk(clk), 
        .rst(rst),
        .PC_Next(PC_F), 
        .PC(PCF)
    );

    Instruction_Memory INSTR_MEM(
        .rst(rst), 
        .A(PCF), 
        .RD(InstrF)
    );

    Adder PC_ADDER(
        .a(PCF), 
        .b(32'd4), 
        .c(PCPlus4F)
    );

    REG_1 REG_IFID(
        .clk(clk),
        .rst(rst),
        .InstrF(InstrF),
        .PCF(PCF),
        .InstrD(InstrD),
        .PCD(PCD)
    );
    
endmodule