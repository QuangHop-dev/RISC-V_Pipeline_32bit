`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2024 01:08:27 AM
// Design Name: 
// Module Name: REG_3
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
module REG_3(
    input clk,rst,
    input ResultSrcE, MemWriteE, RegWriteE,
    input [31:0] ALUResultE,
    input [31:0] SrcBE,
    input [4:0] RDE,
    output reg ResultSrcM, MemWriteM, RegWriteM,
    output reg [31:0] ALUResultM,
    output reg [31:0] WriteDataM,
    output reg [4:0] RDM
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            RegWriteM <= 0;
            ResultSrcM <= 0;
            MemWriteM <= 0;
            ALUResultM <= 0;
            WriteDataM <= 0;
            RDM <= 0;
        end else begin
            RegWriteM <= RegWriteE;
            ResultSrcM <= ResultSrcE;
            MemWriteM <= MemWriteE;
            ALUResultM <= ALUResultE;
            WriteDataM <= SrcBE;
            RDM <= RDE;
        end
    end

endmodule
