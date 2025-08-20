`timescale 1ns / 1ps

module tb_Data_Memory();
    // Inputs
    reg clk, rst, WE;
    reg [31:0] A, WD;
    // Outputs
    wire [31:0] RD;
    // Instantiate the Unit Under Test (UUT)
    Data_Memory DM_Module (
                            .clk(clk), 
                            .rst(rst), 
                            .WE(WE), 
                            .A(A), 
                            .WD(WD), 
                            .RD(RD)
                            );
    always begin
    clk = 1;
    forever #10 clk = ~clk;
    end
    
    initial begin
    A = 32'h5;
    WD = 32'h0;
    WE = 0;#20;
    // Initialize Inputs
     /*   rst = 0;
        WE = 0;
        WD = 32'hAAAAAAAA;
        A = 32'd1;#40;
        
        WE = 1;
        A = 32'd1;#40;
        WE = 0;
        WD =32'hBBBBBBBB;#40;
        WE = 0;
        A = 32'd1;#40;
        WE = 1; #40;
        rst = 1; #40;
        */
        $finish;
    end
      
endmodule