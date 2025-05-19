`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2024 04:14:21 PM
// Design Name: 
// Module Name: tb_Control_Unit
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


module tb_Control_Unit();

	// Inputs
	reg [6:0] Op;
	reg [6:0] funct7;
	reg [2:0] funct3;

	// Outputs
	wire RegWrite;
	wire ALUSrc;
	wire MemWrite;
	wire ResultSrc;
	wire Branch;
	wire [1:0] ImmSrc;
	wire [3:0] ALUControl;

	// Instantiate the Unit Under Test (UUT)
	Control_Unit CU (
		.Op(Op),  
		.funct7(funct7), 
		.funct3(funct3), 
		.RegWrite(RegWrite), 
		.ALUSrc(ALUSrc), 
		.MemWrite(MemWrite), 
		.ResultSrc(ResultSrc), 
		.Branch(Branch), 
		.ImmSrc(ImmSrc), 
		.ALUControl(ALUControl)
	);

	initial begin
		// Initialize Inputs
		Op = 7'b0000011;#10;//load
		Op = 7'b0100011;#10;//store
		Op = 7'b1100011;#10;//branch
		Op = 7'b0010011;#10;//op-imm
		Op = 7'b0110011;
			funct3 = 3'b000;funct7 =7'b0000000;#10;//add
			funct3 = 3'b000;funct7 =7'b0100000;#10;//sub
			funct3 = 3'b000;funct7 =7'b0000001;#10;//mul
			funct3 = 3'b001;funct7 =7'b0000000;#10;//sll
			funct3 = 3'b010;funct7 =7'b0000000;#10;//slt
			funct3 = 3'b100;funct7 =7'b0000000;#10;//xor
			funct3 = 3'b100;funct7 =7'b0000001;#10;//div
			funct3 = 3'b101;funct7 =7'b0000000;#10;//srl
			funct3 = 3'b101;funct7 =7'b0100001;#10;//sra
			funct3 = 3'b110;funct7 =7'b0000000;#10;//or
			funct3 = 3'b110;funct7 =7'b0000001;#10;//rem
			funct3 = 3'b111;funct7 =7'b0000000;#10;//and
		$finish;
	end
      
endmodule
