`timescale 1ns / 1ps

module tb_Mux2();
    reg s;
    reg [31:0] a, b;
    wire [31:0] c;
    
    Mux2 MUX2(.s(s), .a(a), .b(b), .c(c));
  
    initial begin
    a = 32'haaaaaaaa;b = 32'hbbbbbbbb;#10;
    s = 0;#10;
    s = 1;#10;
    $finish;
    end
    
endmodule
