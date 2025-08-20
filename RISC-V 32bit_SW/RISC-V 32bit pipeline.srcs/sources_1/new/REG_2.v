`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2024 12:39:08 AM
// Design Name: 
// Module Name: REG_2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module REG_2(
    input clk,rst,
    input BranchD, ResultSrcD, MemWriteD, RegWriteD,ALUSrcD,
    input [3:0] ALUControlD,
    input [31:0] RD1D,RD2D,
    input [31:0] ImmExtD,
    input [31:0] PCD,
    input [31:0] InstrD,
    output reg BranchE, ResultSrcE, MemWriteE, RegWriteE, ALUSrcE,
    output reg [3:0] ALUControlE,
    output reg [4:0] RS1E, RS2E, RDE,
    output reg [31:0] RD1E, RD2E,
    output reg [31:0] ImmExtE,
    output reg [31:0] PCE 
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            BranchE <= 0;
            ResultSrcE <= 0;
            MemWriteE <= 0;
            RegWriteE <= 0;
            ALUSrcE <= 0;
            ALUControlE <= 0;
            RS1E <= 0;
            RS2E <= 0;
            RDE <= 0;
            RD1E <= 0;
            RD2E <= 0;
            ImmExtE <= 0;
            PCE <= 0;       
        end else begin
            BranchE <= BranchD;
            ResultSrcE <= ResultSrcD;
            MemWriteE <= MemWriteD;
            RegWriteE <= RegWriteD;
            ALUSrcE <= ALUSrcD;
            ALUControlE <= ALUControlD;
            RS1E <= InstrD[19:15];
            RS2E <= InstrD[24:20];
            RDE <= InstrD[11:7];
            RD1E <= RD1D;
            RD2E <= RD2D;
            ImmExtE <= ImmExtD;
            PCE <= PCD; 
        end
    end
endmodule
