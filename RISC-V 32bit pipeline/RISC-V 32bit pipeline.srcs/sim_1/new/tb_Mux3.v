`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2024 03:15:26 PM
// Design Name: 
// Module Name: tb_Mux3
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

module tb_Mux3();
    reg [1:0] s;
    reg [31:0] a, b, c;
    wire [31:0] d;
    
    Mux3 MUX3(.s(s), .a(a), .b(b), .c(c), .d(d));
  
    initial begin
    a = 32'haaaaaaaa;b = 32'hbbbbbbbb;c = 32'hcccccccc;#10;
    s = 2'b00;#10;
    s = 2'b01;#10;
    s = 2'b10;#10;
    s = 2'b11;#10;
    $finish;
    end
    
endmodule

