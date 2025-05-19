`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 02:32:10 PM
// Design Name: 
// Module Name: tb_Extend
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


module tb_Extend();
	reg [31:0] In;
	reg [1:0] ImmSrc;
	wire [31:0] Imm_Ext;

	Extend EXTEND (.In(In), .ImmSrc(ImmSrc), .Imm_Ext(Imm_Ext));

	initial begin
		// Initialize Inputs
        In = 32'b10110110111100010110000101110101;
        ImmSrc = 2'b00;#10;
        ImmSrc = 2'b01;#10; 
        ImmSrc = 2'b10;#10;
        ImmSrc = 2'b11;#10;
        $stop;
	end
      
endmodule
