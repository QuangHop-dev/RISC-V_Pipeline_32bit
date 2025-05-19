`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:16:36 04/22/2024
// Design Name:   Decode_cycle
// Module Name:   E:/KLTN NH23-24/CPU_RISCV_PIPELINING/decode_cycle_tb.v
// Project Name:  CPU_RISCV_PIPELINING
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decode_cycle
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Instruction_Decode_CC;

	// Inputs
	reg clk;
	reg rst;
	reg RegWriteW;
	reg [4:0] RDW;
	reg [31:0] PCD;
	reg [31:0] InstrD;
	reg [31:0] ResultW;

	// Outputs
	wire RegWriteE;
	wire ResultSrcE;
	wire MemWriteE;
	wire BranchE;
	wire ALUSrcE;
	wire [3:0] ALUControlE;
	wire [4:0] RDE;
	wire [4:0] RS1E;
	wire [4:0] RS2E;
	wire [31:0] RD1E;
	wire [31:0] RD2E;
	wire [31:0] PCE;
	wire [31:0] ImmExtE;

	// Instantiate the Unit Under Test (UUT)
	Instruction_Decode_CC uut (
		.clk(clk), 
		.rst(rst), 
		.InstrD(InstrD),
		.RDW(RDW),
		.RegWriteW(RegWriteW), 
		.ResultW(ResultW),
		.PCD(PCD),
		.BranchE(BranchE), 
		.ResultSrcE(ResultSrcE), 	 
		.RegWriteE(RegWriteE), 
		.MemWriteE(MemWriteE), 
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
    // Tao clock
    initial begin
        clk = 1;
        forever #10 clk=~clk; // Chu ky clock la 20ns
    end

// Test simulation
    initial begin
    //test case 1: dat lai
    rst = 1;#20;
    //test case 2: ghi vao thanh ghi
    rst = 0;
    InstrD = 32'hFF718393;//addi x7, x3, -9
    ResultW = 32'hABABABAB;
    RDW = 5'b00011;
    RegWriteW = 0;#40;
    RegWriteW = 1;#40;
    //test case 3: load  lw x4 5(x2)
    PCD = 32'h00000004;
    InstrD = 32'h00512203;#40;
    //test case 4: S-type       sw x5 3(x2)
    PCD = 32'h00000008;
    InstrD = 32'h005121A3;#40;
    //test case 5: B-type       beq x1 x2 -8
    PCD = 32'h0000000c;
    InstrD = 32'hFE208CE3;#40;  
    //test case 6: I-type arith addi x3 x1 2
    PCD = 32'h00000010;
    InstrD = 32'h00208193;#40;
    //test case 7: R-type       add x3 x1 x2
    PCD = 32'h00000014;
    InstrD = 32'h002081B3;#40;
    $finish;
    end
endmodule
