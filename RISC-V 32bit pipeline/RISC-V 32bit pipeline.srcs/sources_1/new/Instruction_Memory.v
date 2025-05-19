`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2024 02:40:53 PM
// Design Name: 
// Module Name: Instruction_Memory
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
module Instruction_Memory(
    input wire rst,
    input wire [31:0] A,
    output wire [31:0] RD
);
    reg [31:0] mem[1023:0];

    assign RD = (rst) ? 32'd0 : mem[A[31:2]];

    initial begin
        $readmemh("A:/Personal Projects/RISC-V 32bit pipeline/memfile.hex", mem);
    end
endmodule