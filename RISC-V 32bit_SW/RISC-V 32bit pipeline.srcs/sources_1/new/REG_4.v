`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2024 11:41:59 AM
// Design Name: 
// Module Name: REG_4
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


module REG_4(
    input clk,rst,
    input ResultSrcM, RegWriteM,
    input [31:0] ALUResultM,
    input [31:0] ReadDataM,
    input [4:0] RDM,
    
    output reg ResultSrcW, RegWriteW,
    output reg [31:0] ALUResultW,
    output reg [31:0] ReadDataW,
    output reg [4:0] RDW
    );
    always @(posedge clk or posedge rst) begin
		if(rst) begin
			ResultSrcW <= 0;
			RegWriteW <= 0;
			ALUResultW <= 0;
			ReadDataW <= 0;
			RDW <= 0;
		end
		else begin
			ResultSrcW <= ResultSrcM;
			RegWriteW <= RegWriteM;
			ALUResultW <= ALUResultM;
			ReadDataW <= ReadDataM;
			RDW <= RDM;
		end
    end
endmodule
