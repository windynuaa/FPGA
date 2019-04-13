`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: nuaa
// Engineer: windy liu
// 
// Create Date: 2019/04/13 09:56:42
// Design Name: 
// Module Name: main_top_sim
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


module main_top_sim(

    );

wire a,b,c;
wire [7:0]res;
wire [7:0]led_res;
reg [7:0]opcode=0;
reg clk=0;
reg rst=0;
reg [7:0]addr=0;
reg [7:0]data=0;
reg wr=0;
reg wvaild=0;
reg wready=0;
reg availd=0;
reg aready=0;
reg [7:0]state=0;

wire [7:0]addrw;
wire [7:0]dataw;
wire wrw;
wire wvaildw;
wire wreadyw;
wire availdw;
wire areadyw;

assign addrw=addr;
assign dataw=data;
assign wrw=wr;
assign wvaildw=wvaild;
//assign wreadyw=wready;
assign availdw=availd;
//assign areadyw=aready;

assign a=opcode[0];
assign b=opcode[1];
assign c=opcode[2];

initial 
begin
    rst=0;
    #100
    rst=1;
    state=1;
    addr=0;
    data=0;
    repeat(255) 
    begin
        #100
        clk=1;
        #100
        clk=0;
    end
 #100 $stop;
end

always@(posedge clk)
begin
    case(state)
    1:
    begin
        #10
        wr=1;
        state=2;
    end
    2:
    begin
        #10
        addr=addr+1;
        availd=1;
        state=3;
    end 
    3:
    begin
        #10
        if(areadyw)
        begin
            availd=0;
            wvaild=1;
            data=data+1;
            state=4;
        end
    end
    4:
    begin
        #10
        if(wreadyw)
        begin
            wvaild=0;
            wvaild=0;
            wr=0;
            state=1;
        end
    end    
    endcase

end



 my_ram ram(
 .addr(addrw),
 .data(dataw),
 .clk(clk),
 .wr(wrw),
 .rst(rst),
 .wvaild(wvaildw),
 .wready(wreadyw),
 .availd(availdw),
 .aready(areadyw)
 );
/*
main_top main(
    .a(a),
    .b(b),
    .c(c),
    .clk(clk),
    .rst(rst),
    .ledinput(opcode),
    .ledoutput(led_res),
    .y(res)
);*/
endmodule
