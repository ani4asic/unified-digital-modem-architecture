`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2025 12:16:40
// Design Name: 
// Module Name: ask_mod_demod
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


module ask_mod_demod(clk,rst,din,mod_out,dout);
input clk,rst,din;
output  [12:0] mod_out;
output   dout;

bask_mod m1(clk,rst,din,mod_out);
bask_demod m2(clk,rst,mod_out,dout);
endmodule
