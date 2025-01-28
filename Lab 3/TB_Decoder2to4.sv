`timescale 1ns / 1ps
module TB_Decoder2to4;
reg d0,d1,en;
wire y0,y1,y2,y3;

Decoder2to4 dut(.d0(d0), .d1(d1), .en(en), .y0(y0), .y1(y1), .y2(y2), .y3(y3) );
initial begin
#100 d0=0; d1=0; en=1;
#100 d0=0; d1=1; en=1;
#100 d0=1; d1=0; en=1; 
#100 d0=1; d1=1; en=1;
#100 d0=0; d1=0; en=0;
#100 d0=0; d1=1; en=0;
#100 d0=1; d1=0; en=0; 
#100 d0=1; d1=1; en=0;
end 
endmodule
