`timescale 1ns / 1ps
module tb_FourDigits();
    logic clk;
    logic reset;
    logic [13:0] number;
    logic [3:0] ones;
    logic [3:0] tens;
    logic [3:0] hundreds;
    logic [3:0] thousands;
    
FourDigits dut(clk,reset,number,ones,tens,hundreds,thousands);

initial begin
    clk = 0;
    reset = 1;
    #5 reset = 0;
    for(int i=8; i<999; i++)begin
        number = i;
        #100;
    end
    
end
    always #5 clk = ~clk;
endmodule
