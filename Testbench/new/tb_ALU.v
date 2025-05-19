`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 02:51:41 PM
// Design Name: 
// Module Name: tb_ALU
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
module tb_ALU();
    // Inputs
    reg [31:0] A, B;
    reg [3:0] ALUControl;
    // Outputs
    wire Carry, OverFlow, Zero, Negative;
    wire [31:0] Result;
    
    ALU ALU (
        .A(A), 
        .B(B), 
        .ALUControl(ALUControl), 
        .Carry(Carry), 
        .OverFlow(OverFlow), 
        .Zero(Zero), 
        .Negative(Negative), 
        .Result(Result)
        );


initial begin
    ALUControl = 4'b0000;//add
        A = 32'd150;B = 32'd50;#10;//A+B
        A = -32'd150;B = 32'd50;#10;//-A+B
        A = -32'd150;B = -32'd50;#10;//-A+-B
    
    ALUControl = 4'b0001;//sub
        A = 32'd150;B = 32'd50;#10;//A-B
        A = -32'd150;B = 32'd50;#10;//-A-B
        A = -32'd150;B = -32'd50;#10;//-A--B
    
    ALUControl = 4'b0010;//mul
        A = 32'd150;B = 32'd50;#10;//A*B
        A = -32'd150;B = 32'd50;#10;//-A*B
        A = -32'd150;B = -32'd50;#10;//-A*-B
    
    ALUControl = 4'b0011;//sll
        A = 32'd255;B = 32'd3;#10;
    
    ALUControl = 4'b0100;//slt
        A = 32'd150;B = 32'd50;#10;//A>B
        A = 32'd50;B = 32'd150;#10;//A<B
    
    ALUControl = 4'b0101;//xor
        A = 32'd15;B = 32'd5;#10;//AxorB #0
        A = 32'd15;B = 32'd15;#10;//AxorB =0
    
    ALUControl = 4'b0110;//div
        A = 32'd15;B = 32'd5;#10;//A>B 
        A = 32'd3;B = 32'd5;#10; //A<B 
        A = 32'd5;B = 32'd0;#10;//B=0
        A = -32'd17;B = 32'd7;#10;//A<0    
       
    ALUControl = 4'b0111;//slr
        A = 32'd255;B = 32'd3;#10;
    
    ALUControl = 4'b1000;//sla
        A = 32'd255 ;B = 32'd3;#10;
    
    ALUControl = 4'b1001;//or
        A = 32'd15;B = 32'd5;#10;
    
    ALUControl = 4'b1010;//rem
        A = 32'd15;B = 32'd5;#10;//A>B rem=0
        A = 32'd3;B = 32'd5;#10; //A<B 
        A = 32'd5;B = 32'd0;#10;//B=0
        A = -32'd17;B = 32'd7;#10;//A<0    
   
    ALUControl = 4'b1011;//and
        A = 32'd15;B = 32'd5;#10;
         
    ALUControl = 4'b1100;#10;

        
        $stop;
 end 

endmodule
