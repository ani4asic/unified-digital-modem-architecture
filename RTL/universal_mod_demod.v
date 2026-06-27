`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2025 13:42:27
// Design Name: 
// Module Name: universal_mod_demod
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


module universal_mod_demod(clk,rst,sel,din,dout,mod_out);
input clk,rst;
input [1:0] sel;
input din;
output dout;
output [11:0] mod_out;

wire [11:0] mod_out;

universal_modulator U1(clk,rst,sel,din,mod_out);
universal_demodulator U2(clk,rst,sel,mod_out,dout);

endmodule
