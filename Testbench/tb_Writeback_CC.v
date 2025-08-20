`timescale 1ns / 1ps

module tb_WriteBack_CC;

	// Inputs
	reg ResultSrcW;
	reg [31:0] ALUResultW;
	reg [31:0] ReadDataW;

	// Outputs
	wire [31:0] ResultW;

	// Instantiate the Unit Under Test (UUT)
	Writeback_CC uut (
		.ResultSrcW(ResultSrcW), 
		.ALUResultW(ALUResultW), 
		.ReadDataW(ReadDataW), 
		.ResultW(ResultW)
	);

	initial begin
	ALUResultW = 32'hDEADBEEF; 
	ReadDataW = 32'hDADA_DADA;
    ResultSrcW = 0; #10;
    ResultSrcW = 1; #10;
    // Wait and finish
    $finish;
    end
      
endmodule

