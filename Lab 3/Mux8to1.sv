`timescale 1ns / 1ps
module Mux8to1(
    input d0,d1,d2,d3,d4,d5,d6,d7,s2,s1,s0,
    output y    
);
wire w1,w2,w3,w4;
Mux4to1 mux1(d0,d1,d2,d3,s1,s0,w1);
Mux4to1 mux2(d4,d5,d6,d7,s1,s0,w2);
and(w3,w1,(~s2));
and(w4,w2,s2);
or(y,w3,w4);

endmodule
