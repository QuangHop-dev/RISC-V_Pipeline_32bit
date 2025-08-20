`timescale 1ns / 1ps
module REG_1(
    input clk,
    input rst,
    input [31:0] InstrF, 
    input [31:0] PCF,
    output reg [31:0] InstrD, 
    output reg [31:0] PCD
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            InstrD <= 32'd0;
            PCD <= 32'd0;
        end else begin
            InstrD <= InstrF;
            PCD <= PCF;
        end
    end
endmodule