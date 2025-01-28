`timescale 1ns / 1ps
module Mux4to1(
    input logic d0, d1, d2, d3,
    input logic [1:0] s,
    output logic y
    );
wire w1, w2;

Mux2to1 mux1(d0, d1, s[0], w1);
Mux2to1 mux2(d2, d3, s[0], w2);
Mux2to1 mux3(w1, w2, s[1], y);
endmodule
