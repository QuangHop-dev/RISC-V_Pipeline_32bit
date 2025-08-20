
`timescale 1ns/1ps

module tb_Instruction_Fetch_CC; 
    // Inputs
    reg clk, rst, PCSrcE;
    reg [31:0] PCTargetE;
    // Outputs
    wire [31:0] InstrD, PCD;

    // Instantiate the Unit Under Test (UUT)
    Instruction_Fetch_CC uut (
        .clk(clk),
        .rst(rst),
        .PCSrcE(PCSrcE),
        .PCTargetE(PCTargetE),
        .InstrD(InstrD),
        .PCD(PCD)
    );
    
    // Clock generation
    initial begin
        clk = 1;
        forever #10 clk = ~clk; // 10ns period clock
    end

    // Test sequence
    initial begin
        // Test Case 1: Reset
        rst = 1;
        PCSrcE = 0;
        PCTargetE = 32'h00000000;
        #20;

        // Test Case 2: Fetch cycle
        rst = 0;
        PCSrcE = 0;
        PCTargetE = 32'h00000028;
        #60;

        // Test Case 3: Branch
        PCSrcE = 1;
        #20;

        // Test Case 4: Continue fetch after branch
        PCSrcE = 0;
        #40;

        // Stop simulation
        $stop;
    end
endmodule