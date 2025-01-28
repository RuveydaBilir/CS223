`timescale 1ns / 1ps
module Mux4to1(
    input d0, d1, d2, d3, s1, s0,
    output y
    );
wire w1, w2;

Mux2to1 mux1(d0, d1, s0, w1);
Mux2to1 mux2(d2, d3, s0, w2);
Mux2to1 mux3(w1, w2, s1, y);

endmodule
