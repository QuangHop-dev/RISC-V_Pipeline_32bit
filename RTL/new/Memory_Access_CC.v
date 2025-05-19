`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:00:56 04/21/2024 
// Design Name: 
// Module Name:    Memory_Acess_CC
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
module Memory_Acess_CC(
	input clk, rst,
	input RegWriteM, ResultSrcM, MemWriteM,
	input [4:0] RDM,
	input [31:0] ALUResultM, WriteDataM,
	
	output RegWriteW, ResultSrcW, 
	output [4:0] RDW,
	output [31:0] ALUResultW, ReadDataW
    );
	
	wire [31:0] ReadDataM;
	
	Data_Memory DT_MEM (
		 .clk(clk), 
		 .rst(rst), 
		 .WE(MemWriteM), 
		 .A(ALUResultM), 
		 .WD(WriteDataM), 
		 .RD(ReadDataM)
		 );
	REG_4 REG_MEMWB (
        .clk(clk),
        .rst(rst),
        .ResultSrcM(ResultSrcM),
        .RegWriteM(RegWriteM),
        .ALUResultM(ALUResultM),
        .ReadDataM(ReadDataM),
        .RDM(RDM),
        .ResultSrcW(ResultSrcW),
        .RegWriteW(RegWriteW),
        .ALUResultW(ALUResultW),
        .ReadDataW(ReadDataW),
        .RDW(RDW)
    );

endmodule
