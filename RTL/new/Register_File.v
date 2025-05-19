`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2024 06:19:23 PM
// Design Name: 
// Module Name: Register_File
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

module Register_File(
    input clk, rst, WE,
    input [4:0] A1, A2, A3,
    input [31:0] WD,
    output [31:0] RD1, RD2
);
reg [31:0] Register [31:0];
integer i;

always @ (posedge clk or posedge rst) begin
    if (rst) begin
        for (i = 0; i < 32; i = i + 1) begin
            Register[i] <= 32'h00000000;
        end
    end else if (WE & (A3 != 5'h00)) begin
        Register[A3] <= WD;
    end
end

assign RD1 = Register[A1];
assign RD2 = Register[A2];

endmodule