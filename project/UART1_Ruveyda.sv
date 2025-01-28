`timescale 1ns / 1ps
module UART1_Ruveyda#(parameter bitNum=8)(
    input clk, //reset,
    input [bitNum-1:0] data,
    input BTNC, //for load operation
    input BTND, //for transmit operation
    input R,
    output T,
    output reg [bitNum-1:0] T_Buf,
    output reg [bitNum-1:0] R_Buf
);
wire isSuccessfulT,isSuccessfulR;

Transmitter t(clk,data,BTNC,BTND,isSuccessfulT,T,T_buf);
Receiver r(clk,R,isSuccessfulR,R_buf);

endmodule
