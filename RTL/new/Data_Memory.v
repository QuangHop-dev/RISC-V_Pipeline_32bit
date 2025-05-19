`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 11:16:08 PM
// Design Name: 
// Module Name: Data_Memory
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

module Data_Memory(
    input clk, rst, WE,
    input [31:0] A, 
    input [31:0] WD,
    output reg [31:0] RD
);
    
    reg [31:0] mem [1023:0];
    integer i;

    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 1024; i = i + 1) begin 
                mem[i] <= 32'h00000000;
            end
        end else if (WE && A < 1024) begin
            mem[A] <= WD;
        end
    end

    always @(*) begin
        if (A < 1024) begin
            RD = mem[A];
        end else begin
            RD = 32'h00000000; // or some other default value or error signal
        end
    end

endmodule