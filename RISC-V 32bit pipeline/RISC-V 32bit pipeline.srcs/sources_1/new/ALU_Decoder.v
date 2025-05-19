`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2024 04:07:50 PM
// Design Name: 
// Module Name: ALU_Decoder
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
module ALU_Decoder(
    input [1:0]ALUOp,
    input [2:0]funct3,
    input [6:0]funct7,op,
    output [3:0]ALUControl
    );
    
    assign ALUControl = (ALUOp == 2'b00) ? 4'b0000 ://lw,sw
                        (ALUOp == 2'b01) ? 4'b0001 ://beq
                        ((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 4'b1011 ://and
                        ((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 4'b0100 ://slt
                        ((ALUOp == 2'b10) & (funct3 == 3'b001)) ? 4'b0011 ://sll								
                        ((ALUOp == 2'b10) & (funct3 == 3'b110) & (funct7[0] == 1'b1)) ? 4'b1010 ://rem
                        ((ALUOp == 2'b10) & (funct3 == 3'b110) & (funct7[0] == 1'b0)) ? 4'b1001 ://or
                        ((ALUOp == 2'b10) & (funct3 == 3'b101) & (funct7[5] == 1'b1)) ? 4'b1000 ://sra
                        ((ALUOp == 2'b10) & (funct3 == 3'b101) & (funct7[5] == 1'b0)) ? 4'b0111 ://srl
                        ((ALUOp == 2'b10) & (funct3 == 3'b100) & (funct7[0] == 1'b1)) ? 4'b0110 ://div
                        ((ALUOp == 2'b10) & (funct3 == 3'b100) & (funct7[0] == 1'b0)) ? 4'b0101 ://xor
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({op[5],funct7[5],funct7[0]} == 3'b101)) ? 4'b0010 ://mul
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({op[5],funct7[5],funct7[0]} == 3'b110)) ? 4'b0001 ://sub
                                                                                                            4'b0000;//add	
endmodule
