`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2024 03:35:32 PM
// Design Name: 
// Module Name: RISCV_Top_tb
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
module RISCV_Top_tb();
    reg clk, rst;

    // Instantiate the RISCV_Top module
    RISCV_Top uut (
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #10 clk = ~clk;
    end

    // Reset generation
    initial begin
        rst = 1; 
        #20;        // Ensure reset is held for at least one clock cycle
        rst = 0; 
        #480;      // Run simulation for a sufficient period
    $finish;    // End the simulation
    end

endmodule
