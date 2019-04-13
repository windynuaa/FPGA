`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: nuaa
// Engineer: windy liu
// 
// Create Date: 2019/04/13 10:26:30
// Design Name: 
// Module Name: led
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


module led(
    input [7:0] inputs,
    output [7:0] outputs
    );

assign outputs[0]=inputs[0]^inputs[1];
assign outputs[1]=inputs[1]^inputs[2];
assign outputs[2]=inputs[2]^inputs[3];
assign outputs[3]=inputs[3]^inputs[4];
assign outputs[4]=inputs[4]^inputs[5];
assign outputs[5]=inputs[5]^inputs[6];
assign outputs[6]=inputs[6]^inputs[7];
assign outputs[7]=inputs[7]^inputs[0];

endmodule
