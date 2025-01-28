`timescale 1ns / 1ps
module tb_FourDigitDisplay();
    logic clk;
    logic [15:0] num;
    logic [0:6] seg;
    logic [3:0] digit;

FourDigitDisplay dut(clk,num,seg,digit);

initial begin
    clk = 0;
    num = 15'b1; #100;
    num = 15'b111; #100;
end
    always #5 clk = ~clk;
endmodule
