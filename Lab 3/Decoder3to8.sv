`timescale 1ns / 1ps
module Decoder3to8(
    input d0, d1, d2, d3, en,
    output y0, y1, y2, y3, y4, y5, y6, y7
);
wire en1, en2;
and and1(en1, en, (~d0));
and and2(en2, en, d0);
Decoder2to4 dec1(d1,d2,en1,y0,y1,y2,y3);
Decoder2to4 dec2(d1,d2,en2,y4,y5,y6,y7);

endmodule
