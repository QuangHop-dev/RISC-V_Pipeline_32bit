`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2024 03:22:43 PM
// Design Name: 
// Module Name: tb_Program_Counter
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


module tb_Program_Counter();
    reg clk, rst;
    reg [31:0] PC_Next;
    wire [31:0] PC;

    Program_Counter ModulePC (.clk(clk), .rst(rst), .PC_Next(PC_Next), .PC(PC));

    initial begin
        clk = 1'b1;
        forever #10 clk = ~clk;
    end

    initial begin
        rst = 1'b0;
        PC_Next = 32'h0000aaaa; #20;
        PC_Next = 32'h0000bbbb; #20;
        PC_Next = 32'h0000cccc; #20;
        rst = 1'b1;#20;
        $finish;
    end
endmodule
