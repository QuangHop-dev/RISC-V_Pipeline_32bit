`timescale 1ns / 1ps

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