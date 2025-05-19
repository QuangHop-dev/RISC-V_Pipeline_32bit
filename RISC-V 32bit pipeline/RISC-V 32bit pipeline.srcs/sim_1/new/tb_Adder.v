`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2024 02:54:44 PM
// Design Name: 
// Module Name: tb_Adder
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
module tb_Adder();
    reg [31:0] a, b;
    wire [31:0] c;
    
    Adder ADDER(.a(a), .b(b), .c(c));
 
    initial begin
    a = 32'h0000aaaa;b = 32'h0000bbbb;#10;
    a = 32'hffffffff;b = 32'hffffffff;#10;
    a = 32'hfffffffa;b = 32'h0000002c;#10;
    $finish;
    end
    
endmodule
