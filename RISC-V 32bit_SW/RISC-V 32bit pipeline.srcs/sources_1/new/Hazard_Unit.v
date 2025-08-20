`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:57:10 04/21/2024 
// Design Name: 
// Module Name:    Hazard_Unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Hazard_Unit(
    input rst,
    input RegWriteM, RegWriteW,
    input [4:0] RS1E, RS2E,
    input [4:0] RDM, RDW,
    output reg [1:0] ForwardAE, ForwardBE
);

//ForwardAE
    always @(*) begin
        if (rst == 1'b1) begin
            ForwardAE = 2'b00;
        end else if ((RegWriteM == 1'b1) && (RDM != 5'h00) && (RDM == RS1E)) begin
            ForwardAE = 2'b10;
        end else if ((RegWriteW == 1'b1) && (RDW != 5'h00) && (RDW == RS1E)) begin
            ForwardAE = 2'b01;
        end else begin
            ForwardAE = 2'b00;
        end
    end
    
//ForwardBE
always @(*) begin
    if (rst == 1'b1) begin
        ForwardBE = 2'b00;
    end else if ((RegWriteM == 1'b1) && (RDM != 5'h00) && (RDM == RS2E)) begin
        ForwardBE = 2'b10;
    end else if ((RegWriteW == 1'b1) && (RDW != 5'h00) && (RDW == RS2E)) begin
        ForwardBE = 2'b01;
    end else begin
        ForwardBE = 2'b00;
    end
end


endmodule
