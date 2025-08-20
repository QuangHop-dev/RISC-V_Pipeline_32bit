`timescale 1ns / 1ps

module tb_Instruction_Memory();
    reg rst;
    reg [31:0] A;
    wire [31:0] RD;
    
    Instruction_Memory IM_Module (.rst(rst), .A(A), .RD(RD));

    initial begin
        rst = 0; 
        A = 32'h00000000;#10;
        A = 32'h00000004;#10;
        A = 32'h00000008;#10;
        A = 32'h0000000C;#10;
        A = 32'h00000010;#10;
        rst = 1;
        A = 32'h0000000C;#10;
        A = 32'h00000010;#10;
        $stop;
    end   
	
endmodule
