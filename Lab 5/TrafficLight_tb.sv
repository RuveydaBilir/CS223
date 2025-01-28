`timescale 1ns / 1ps
module TrafficLight_tb();
logic clk, reset, sa, sb;
logic [2:0] La_out;
logic [2:0] Lb_out;

TrafficLight dut(clk,reset,sa,sb,La_out,Lb_out);

initial begin
    clk=0;
    reset=1; #10 reset=0;
    sa=0; sb=0;
    #200; sb=1;
    #200; sa=1; sb=0;
    #200; sb=1;
    #200; sa=0; sb=0;
end
    always #5 clk = ~clk;
    
endmodule
