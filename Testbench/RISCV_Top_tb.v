`timescale 1ns / 1ps

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
