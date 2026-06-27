`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2025 13:28:15
// Design Name: 
// Module Name: universal_demodulator
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


module universal_demodulator(clk,rst,sel,din,dout);
input clk;
input rst;
input [1:0] sel;
input [11:0] din;
output reg dout;
wire  dout1, dout2, dout3;

bask_demod ask(clk,rst,din,dout1);
bfsk_demod fsk(clk,rst,din,dout2);
bpsk_demod psk(clk,rst,din,dout3);

always @ (posedge clk or posedge rst)
begin 
           if (rst)
           begin
           dout<=1'b0;
           end
           else
            begin
               if (sel == 2'b00)
                   dout <= dout1;
               else if (sel == 2'b01)
                   dout <= dout2;
               else if(sel == 2'b10)
                    dout <= dout3;
               else 
                    dout <= dout1;
            end
end
endmodule


