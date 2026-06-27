`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2025 21:50:06
// Design Name: 
// Module Name: universal_demod_tb
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


module universal_demod_tb();
reg clk;
reg rst;
reg [1:0] sel;
reg [11:0] din;
wire dout;

universal_demodulator uut(clk,rst,sel,din,dout);

initial
        begin
        clk = 1'b0;
        rst = 1'b1;
        sel = 1'b0;
        din = 12'd0;
        end
always #5 clk = ~clk;

initial
begin 
    #10 rst = 1'b0;din = 12'hFFF;sel = 2'b00;
    #10 sel = 2'b01;
    #10 sel = 2'b10;
    #10 sel = 2'b11;
    #20 $finish;
end  
endmodule
