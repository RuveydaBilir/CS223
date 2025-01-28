`timescale 1ns / 1ps
module tb_CodeConverter();
    logic [3:0] w;
    logic [6:0] segments;
 
CodeConverter dut(w,segments);

initial begin
    for(int i=9; i<16; i++)begin
        w = i;
        #100;
    end
end
endmodule
