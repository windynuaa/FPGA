`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: nuaa
// Engineer: windy liu
// 
// Create Date: 2019/04/13 10:44:06
// Design Name: 
// Module Name: decoder38_syn
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


module decoder38_syn(
    input a,
    input b,
    input c,
    input clk,
    input rst,
    output [7:0] y
    );
    
reg [7:0]result;
reg [2:0]input_reg;
assign y=result;

always@(a or b or c)
begin
    input_reg={c,b,a};
end

always@(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        result<=0;
    end
    else
    begin
        case (input_reg)
            3'b000:result=8'b0000_0001;
            3'b001:result=8'b0000_0010;
            3'b010:result=8'b0000_0100;
            3'b011:result=8'b0000_1000;
            3'b100:result=8'b0001_0000;
            3'b101:result=8'b0010_0000;
            3'b110:result=8'b0100_0000;
            3'b111:result=8'b1000_0000;
        endcase    
    end
end
        
endmodule
