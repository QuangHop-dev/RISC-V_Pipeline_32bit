`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:10:20 04/22/2024
// Design Name:   Hazard_Unit
// Module Name:   E:/KLTN NH23-24/CPU_RISCV_PIPELINING/Hazard_Unit_tb.v
// Project Name:  CPU_RISCV_PIPELINING
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Hazard_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Hazard_Unit;

    // Inputs
    reg rst;
    reg RegWriteM;
    reg RegWriteW;
    reg [4:0] RS1E;
    reg [4:0] RS2E;
    reg [4:0] RDM;
    reg [4:0] RDW;

    // Outputs
    wire [1:0] ForwardAE;
    wire [1:0] ForwardBE;

    // Instantiate the Unit Under Test (UUT)
    Hazard_Unit uut (
        .rst(rst), 
        .RegWriteM(RegWriteM), 
        .RegWriteW(RegWriteW), 
        .RS1E(RS1E), 
        .RS2E(RS2E), 
        .RDM(RDM), 
        .RDW(RDW), 
        .ForwardAE(ForwardAE), 
        .ForwardBE(ForwardBE)
    );

    // Test case procedure
    initial begin
    // Test Case 1: Reset
    rst = 1; #20;
    // Test Case 2: No forwarding
    rst = 0; 
    RegWriteM = 0; 
    RegWriteW = 0; 
    RS1E = 5'h1; 
    RS2E = 5'h2; 
    RDM = 5'h3; 
    RDW = 5'h4;
    #20;
    // Test Case 3: Forward from EX/MEM stage to ALU input A
    RegWriteM = 1;
    RDM = 5'h1;
    #20;
    // Test Case 4: Forward from MEM/WB stage to ALU input B
    RegWriteM = 0;
    RegWriteW = 1;
    RDW = 5'h2;
    #20;
    // Test Case 5: No forwarding due to zero registers
    RS1E = 5'h0;
    RS2E = 5'h0;
    #20;
    // Test Case 6: Both forwarding paths active
    RS1E = 5'h1;
    RS2E = 5'h2;
    RegWriteM = 1;
    RegWriteW = 1;
    RDM = 5'h1;
    RDW = 5'h2;
    #20;
    // Test Case 7: Forward from MEM/WB stage to ALU input A
    RegWriteM = 0;
    RegWriteW = 1;
    RDM = 5'h3;
    RDW = 5'h1;
    RS1E = 5'h1;
    RS2E = 5'h3;
    #20;
    // Test Case 8: Forward from EX/MEM stage to ALU input B
    RegWriteM = 1;
    RegWriteW = 0;
    RDM = 5'h2;
    RDW = 5'h3;
    RS1E = 5'h3;
    RS2E = 5'h2;
    #20;
    $finish;
    end
endmodule
