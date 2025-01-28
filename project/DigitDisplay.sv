`timescale 1ns / 1ps
module DigitDisplay(
    input clk,
    input [3:0] d1,
    input [3:0] d2,
    input [3:0] d3,
    input [3:0] d4,
    output reg [3:0] anode,
    output [6:0] ct //cathode
);
localparam baudRate = 9600;
localparam freq = 100_000_000;
localparam baudClock = freq/baudRate;

wire slowClk;
reg [1:0] re;
reg [3:0] curDigit;

integer timer;

divClk clk1(clk, baudRate, slowClk);

always@(posedge slowClk) re <=  re+1;

always @ (re) begin
    case (re)
        0: anode<=4'b1110;
        1: anode<=4'b1101;
        2: anode<=4'b1011;
        3: anode<=4'b0111;
        default: anode<=4'b1110;
    endcase
end

always @ (re) begin
    case (re)
        0: curDigit<=d1;
        1: curDigit<=d2;
        2: curDigit<=d3;
        3: curDigit<=d4;
        default: curDigit<=d1;
    endcase
end
SegmentDecoder s(curDigit, ct);
endmodule
