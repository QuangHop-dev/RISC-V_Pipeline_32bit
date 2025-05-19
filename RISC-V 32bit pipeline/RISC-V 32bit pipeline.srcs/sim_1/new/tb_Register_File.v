`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2024 11:16:07 PM
// Design Name: 
// Module Name: tb_Register_File
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


module tb_Register_File();
	reg clk,rst,WE;
	reg [4:0] A1, A2, A3;
	reg [31:0] WD;
	// Outputs
	wire [31:0] RD1, RD2; 

	// Instantiate the Unit Under Test (UUT)
	Register_File REG_FILE (
		.clk(clk), 
		.rst(rst), 
		.WE(WE), 
		.A1(A1), 
		.A2(A2), 
		.A3(A3), 
		.WD(WD), 
		.RD1(RD1), 
		.RD2(RD2)
	);

    initial begin
        clk = 1;
        forever #10 clk = ~clk; 
    end

    initial begin
    rst = 1;#40;
        rst = 0;
        A1 = 5'd3;A2 = 3;A3 = 5'd0;
        WD = 32'hBABABABA;
        WE = 0; #40;
        
        A3 = 5'd3;#40;
        
        WE = 1;#40;
        
        A1 = 5'd4;A2 = 5'd5;#40;
        A3 = 5'd4;#20;
        A3 = 5'd5;#20;
        WD = 32'hBABABABA;
        
        
        $finish;    
    end
        
endmodule
