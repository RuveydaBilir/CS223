`timescale 1ns / 1ps
module TwoDigitCounter_tb();
    logic clk;
    logic enable;
    logic load;
    logic [7:0] w;
    logic [0:6] seg;
    logic [3:0] digit;
    
TwoDigitCounter dut(clk,enable,load,w,seg,digit);

initial begin
    clk=0;
    w = 6;
    enable = 1; #5;
    load = 1; #300;
    enable = 0; #50;
    load = 0; w=4;
    
end
    
    always #5 clk=~clk;
endmodule
