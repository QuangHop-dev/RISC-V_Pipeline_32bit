`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 11:52:09 PM
// Design Name: 
// Module Name: Writeback_CC
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


module Writeback_CC(
	input ResultSrcW,
	input [31:0] ALUResultW,ReadDataW,
	output [31:0] ResultW
    );

	Mux2 MUX_W (
		 .a(ALUResultW), 
		 .b(ReadDataW), 
		 .s(ResultSrcW), 
		 .c(ResultW)
		 );

endmodule