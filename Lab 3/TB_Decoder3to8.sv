`timescale 1ns / 1ps
module TB_Decoder3to8;
reg d0,d1,d2,en;
wire y0,y1,y2,y3,y4,y5,y6,y7;

Decoder3to8 dut(.d0(d0),.d1(d1),.d2(d2),.en(en),.y0(y0),.y1(y1),.y2(y2),.y3(y3),.y4(y4),.y5(y5),.y6(y6),.y7(y7) );

initial begin

#100 d0=0; d1=0; d2=1; en=1;
#100 d0=0; d1=1; d2=1; en=1;
#100 d0=1; d1=0; d2=1; en=1;
#100 d0=1; d1=1; d2=1; en=1;
#100 d0=0; d1=0; d2=0; en=1;
#100 d0=0; d1=1; d2=0; en=1;
#100 d0=1; d1=0; d2=0; en=1;
#100 d0=1; d1=1; d2=0; en=1;
#100 d0=0; d1=0; d2=1; en=0;
#100 d0=0; d1=1; d2=1; en=0;
#100 d0=1; d1=0; d2=1; en=0;
#100 d0=1; d1=1; d2=1; en=0;
#100 d0=0; d1=0; d2=0; en=0;
#100 d0=0; d1=1; d2=0; en=0;
#100 d0=1; d1=0; d2=0; en=0;
#100 d0=1; d1=1; d2=0; en=0;

end
endmodule
