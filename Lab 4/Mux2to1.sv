`timescale 1ns / 1ps
module Mux2to1(
    input logic d0, d1, s,
    output logic y
);
assign y = ((~s)&(d0))|(s&d1); 
endmodule