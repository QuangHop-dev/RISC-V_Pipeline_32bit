`timescale 1ns / 1ps

module Mux2(
    input s,
    input [31:0] a,b,
    output[31:0] c
    );
    
    assign c = (s)? b : a;

endmodule
