`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/13 11:36:39
// Design Name: 
// Module Name: my_ram
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


module my_ram(
    //data bus
    inout [7:0]addr,
    inout [7:0]data,
    
    input wr,
    input clk,
    input rst,
    
    output reg rvaild,
    input rready,
    
    input  wvaild,
    output reg wready,
    
    input  availd,
    output reg aready
 );
reg [7:0]addr_reg;
reg [7:0]data_reg;
reg [7:0]ram_reg[127:0];
reg [7:0]state=0;


always@(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        state=0;
    end
    else
    begin
        if(wr)
        begin
            case(state)
            4'b0000:
            begin
                #10
                if(availd)
                begin
                    addr_reg<=addr;
                    aready<=1;
                    state<=4'b0001;
                end            
            end
            4'b0001:
            begin
                #10
                aready<=0;
                if(wvaild)
                begin
                    data_reg<=data;
                    ram_reg[addr_reg]<=data_reg;
                    wready<=1;
                    state<=4'b0010;
                end        
            end
            4'b0010:
            begin
                #10
                wready<=0;
                state<=4'b0000;          
            end
            endcase
        end
    end
end



endmodule
