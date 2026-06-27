`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 23:16:51
// Design Name: 
// Module Name: universal_modulator
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


module universal_modulator(clk,rst,sel,din,dout);
input clk,rst;
input [1:0] sel;
input din;
output reg [11:0] dout;
wire [11:0] dout1, dout2, dout3;

bask_mod ask(clk,rst,din,dout1);
bfsk_mod fsk(clk,rst,din,dout2);
bpsk_mod psk(clk,rst,din,dout3);

always @ (posedge clk or posedge rst)
begin 
           if (rst)
           dout<=1'b0;
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
