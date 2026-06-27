`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2025 21:09:34
// Design Name: 
// Module Name: universal_mod_tb
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


module universal_mod_tb();
reg clk,rst;
reg [1:0] sel;
reg din;
wire [11:0] dout;

universal_modulator uut(clk,rst,sel,din,dout);
initial
begin 
        clk = 1'b0; 
        rst = 1'b1; 
        din = 1'b0;
        sel = 2'b00;
end
always #5 clk = ~clk;

initial
begin 
  #10 rst = 0;
      din = 1;
  #2000 din = 0;
  #4000 din = 1;
  #2000 din = 0;
  #3000 din = 1;
  #5000 din = 0;
  #2000 din = 0;
  #4000 din = 1; sel = 01;
  #6000 din = 0;
  #5000 din = 1;
  #5000 din = 0;
  #4000 din = 1; 
  #4000 din = 0; sel = 10;
  #5000 din = 1; 
  #5000 din = 0; 
  #5000 din = 1; 
  #5000 din = 0; 
  #4000 din = 1; 
  #500  $finish ;
end
endmodule
