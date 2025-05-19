`timescale 1ns / 1ps

module Program_Counter(
    input clk, rst,
    input [31:0] PC_Next,
    output reg [31:0] PC
);

always @(posedge clk or posedge rst) begin
    if (rst) 
        PC <= 32'b0;     
    else
        PC <= PC_Next;  
end

endmodule
