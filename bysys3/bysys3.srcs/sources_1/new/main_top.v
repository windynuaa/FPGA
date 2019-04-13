`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: nuaa
// Engineer: windy liu
// 
// Create Date: 2019/04/13 09:44:08
// Design Name: 
// Module Name: main_top
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


module main_top(
input clk,
input rst,
input a,
input b,
input c,
input  [7:0]ledinput,
output [7:0]ledoutput,
output [7:0]y
    );

led testled(
    .inputs(ledinput),
    .outputs(ledoutput)
);
    
decoder38_syn decode(
    .a(a),
    .b(b),
    .c(c),
    .clk(clk),
    .rst(rst),
    .y(y)
);
endmodule


