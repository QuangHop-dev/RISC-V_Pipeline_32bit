`timescale 1ns / 1ps

module Mux3(
    input [1:0] s,
    input [31:0] a,b,c,
    output[31:0] d
    );
    
    assign d = (s==2'b00)? a :
               (s==2'b01)? b : 
               (s==2'b10)? c : 32'hx;

endmodule
