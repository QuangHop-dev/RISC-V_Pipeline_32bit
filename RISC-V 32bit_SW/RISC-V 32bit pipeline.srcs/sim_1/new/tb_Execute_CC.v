`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2024 12:40:13 AM
// Design Name: 
// Module Name: tb_Execute_CC
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
module tb_Execute_CC();
    reg clk, rst;
    reg RegWriteE;
    reg ResultSrcE;
    reg MemWriteE;
    reg BranchE;
    reg ALUSrcE;
    reg [1:0] ForwardAE;
    reg [1:0] ForwardBE;
    reg [3:0] ALUControlE;
    reg [4:0] RDE;
    reg [31:0] RD1E;
    reg [31:0] RD2E;
    reg [31:0] ImmExtE;
    reg [31:0] PCE;
    reg [31:0] ResultW;

    // Outputs
    wire RegWriteM;
    wire ResultSrcM;
    wire MemWriteM;
    wire PCSrcE;
    wire [4:0] RDM;
    wire [31:0] WriteDataM;
    wire [31:0] PCTargetE;
    wire [31:0] ALUResultM;

    // Instantiate the Unit Under Test (UUT)
    Execute_CC uut (
        .clk(clk), 
        .rst(rst), 
        .RegWriteE(RegWriteE), 
        .ResultSrcE(ResultSrcE), 
        .MemWriteE(MemWriteE), 
        .BranchE(BranchE), 
        .ALUSrcE(ALUSrcE), 
        .ForwardAE(ForwardAE), 
        .ForwardBE(ForwardBE), 
        .ALUControlE(ALUControlE), 
        .RDE(RDE), 
        .RD1E(RD1E), 
        .RD2E(RD2E), 
        .ImmExtE(ImmExtE), 
        .PCE(PCE), 
        .ResultW(ResultW), 
        .RegWriteM(RegWriteM), 
        .ResultSrcM(ResultSrcM), 
        .MemWriteM(MemWriteM), 
        .PCSrcE(PCSrcE), 
        .RDM(RDM), 
        .WriteDataM(WriteDataM), 
        .PCTargetE(PCTargetE), 
        .ALUResultM(ALUResultM)
    );

    // Generate clock signal
    initial begin
        clk = 1;
        forever #10 clk = ~clk; // Clock period 20ns
    end

    initial begin
        // Initialize Inputs
        rst = 1;
        RegWriteE = 0;
        ResultSrcE = 0;
        MemWriteE = 0;
        BranchE = 0;
        ALUSrcE = 0;
        ForwardAE = 0;
        ForwardBE = 0;
        ALUControlE = 4'b0010; // ALU operation
        RDE = 5;
        RD1E = 10;
        RD2E = 20;
        ImmExtE = 4;
        PCE = 0;
        ResultW = 0;

        // Wait 40 ns for global reset to finish
        #40;
        rst = 0;
        RegWriteE = 1;
        ResultSrcE = 1;
        MemWriteE = 1;
        BranchE = 1;
        ALUSrcE = 1;
        ForwardAE = 2'b01; 
        ForwardBE = 2'b10; 
        ResultW = 15; 

        #20; 
        ALUControlE = 4'b0110; // Change ALU operation

        #20;  
        ALUControlE = 4'b0000; // Change ALU operation
        RD1E = 35;
        RD2E = 5;
        ImmExtE = 10;

        #20;
        $finish; // End simulation
    end
endmodule
