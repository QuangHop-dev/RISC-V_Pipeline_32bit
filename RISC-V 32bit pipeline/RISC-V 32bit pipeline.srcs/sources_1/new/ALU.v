`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 02:05:59 AM
// Design Name: 
// Module Name: ALU
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
module ALU(
    input [31:0]A,B,
    input [3:0]ALUControl,
    output Carry,OverFlow,Zero,Negative,
    output [31:0]Result
    );
    
    wire Cout;
    wire [31:0]Sum, Div, Rem;
    
    Division DIV_MODULE(.A(A), .B(B), .Div(Div), .Rem(Rem));
    
    assign Sum = (ALUControl[0] == 1'b0) ? (A + B) : (A + ((~B)+1)) ;
    
    assign {Cout,Result} = (ALUControl == 4'b0000) ? Sum :
                           (ALUControl == 4'b0001) ? Sum :
                           (ALUControl == 4'b0010) ? A * B :
                           (ALUControl == 4'b0110) ? ((B != 0) ? Div : 32'h0) :
                           (ALUControl == 4'b1010) ? ((B != 0) ? Rem : 32'h0) :
                           (ALUControl == 4'b0101) ? A ^ B :
                           (ALUControl == 4'b1001) ? A | B :
                           (ALUControl == 4'b1011) ? A & B :
                           (ALUControl == 4'b0100) ? {{32{1'b0}}, (A < B)}:
                           (ALUControl == 4'b0011) ? ((B < 32'd32) ? A << B : 32'h0) :
                           (ALUControl == 4'b0111) ? ((B < 32'd32) ? A >> B : 32'h0) :
                           (ALUControl == 4'b1000) ? ((B < 32'd32) ? A >>> B : 32'h0) : 32'h0;
    assign OverFlow = ((Sum[31] ^ A[31]) & (~(ALUControl[0] ^ B[31] ^ A[31])) & (~ALUControl[1]));
    assign Carry = ((~ALUControl[1]) & Cout);
    assign Zero = &(~Result);
    assign Negative = Result[31];  

endmodule 
