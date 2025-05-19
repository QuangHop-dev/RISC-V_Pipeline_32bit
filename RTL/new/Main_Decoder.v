`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2024 04:03:44 PM
// Design Name: 
// Module Name: Main_Decoder
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
module Main_Decoder(
    input [6:0]Op,
    output RegWrite,ALUSrc,MemWrite,ResultSrc,Branch,
    output [1:0]ImmSrc,ALUOp
    );
                    //(      I-type		|		  I-type     |        R-type    )
    assign RegWrite = (Op == 7'b0000011 | Op == 7'b0010011 | Op == 7'b0110011 ) ? 1'b1 : 1'b0 ;  
    assign ImmSrc = (Op == 7'b0000011 | Op == 7'b0010011) ? 2'b00 :// I-type
                    (Op == 7'b0100011) ? 2'b01 : //S-type
                    (Op == 7'b1100011) ? 2'b10 : //B-type   		
                                         2'b00; //R-type
                  //(      I-type		 |		  S-type      |        I-type    )
    assign ALUSrc = (Op == 7'b0000011 | Op == 7'b0100011 | Op == 7'b0010011) ? 1'b1 : 1'b0 ;   
    assign MemWrite = (Op == 7'b0100011) ? 1'b1 : 1'b0 ;//S-type    
    assign ResultSrc = (Op == 7'b0110011 | Op == 7'b0010011) ? 1'b0 :// R-type,I-type-arith
                       (Op == 7'b0000011) ? 1'b1 : //I-type-loads
                                            1'b0 ;
    assign Branch = (Op == 7'b1100011) ? 1'b1 : 1'b0 ;//B-Type
    assign ALUOp = (Op == 7'b0110011) ? 2'b10 : //R-Type 
                   (Op == 7'b1100011) ? 2'b01 : //B-Type
                                        2'b00;  //I-Type,S-Type 
endmodule 