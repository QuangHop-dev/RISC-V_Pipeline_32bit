`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:15:45 04/22/2024
// Design Name:   Memory_Cycle
// Module Name:   E:/KLTN NH23-24/CPU_RISCV_PIPELINING/Memory_Cycle_tb.v
// Project Name:  CPU_RISCV_PIPELINING
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Memory_Cycle
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Memory_Acess_CC;
    // Inputs
    reg clk, rst;
    reg RegWriteM;
    reg ResultSrcM;
    reg MemWriteM;
    reg [4:0] RDM;
    reg [31:0] ALUResultM;
    reg [31:0] WriteDataM;

    // Outputs
    wire RegWriteW;
    wire ResultSrcW;
    wire [31:0] ALUResultW;
    wire [31:0] ReadDataW;
    wire [4:0] RDW;

    // Instantiate the Unit Under Test (UUT)
    Memory_Acess_CC uut (
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

    // Generate clock signal
    initial begin
        clk = 1;
        forever #10 clk = ~clk; // Clock period 20ns
    end

    initial begin
    // Initialize Inputs
    // Test case 1: reset
    ALUResultM = 32'h5;
    WriteDataM = 32'h0;
    MemWriteM = 0;#20;
   /* ResultSrcM = 0;
    RegWriteM = 0;
    RDM = 0;
    
    MemWriteM = 0;
    ALUResultM = 0;
    WriteDataM = 0;
    rst = 1;#20;
    // Test Case 2: Write/read to memory   
    rst = 0; 
    ResultSrcM = 1;
    RegWriteM = 1;
    RDM = 5'h5;
    
    MemWriteM = 1;
    ALUResultM = 32'd5;  
    WriteDataM = 32'hA5A5A5A5;
    #40;
    // Test Case 3: enable write to memory
    MemWriteM = 0;
    ALUResultM = 32'd5;  
    WriteDataM = 32'hDEADBEEF;
    #40;*/
    $finish;
    end
endmodule


