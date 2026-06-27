`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2025 13:13:51
// Design Name: 
// Module Name: fsk_mod_demod
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


module fsk_mod_demod(clk,rst,din,mod_out,dout);
input clk,rst,din;
output  [12:0] mod_out;
output   dout;

bfsk_mod m1(clk,rst,din,mod_out);
bfsk_demod m2(clk,rst,mod_out,dout);
endmodule
