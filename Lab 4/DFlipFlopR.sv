`timescale 1ns / 1ps
module DFlipFlopR(
    input logic clk, reset, 
    input logic d,
    output logic q
);
integer t;
initial t=0;

always @ (posedge clk)begin
    if(reset) q <= 1'b0;
    else
       q <= d;
end
endmodule
