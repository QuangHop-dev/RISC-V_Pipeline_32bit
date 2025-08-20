`timescale 1ns / 1ps

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
