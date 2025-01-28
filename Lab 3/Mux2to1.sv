`timescale 1ns / 1ps
module Mux2to1(
    input d0, d1, s,
    output y
);
assign y = ((~s)&(d0))|(s&d1); 
endmodule
