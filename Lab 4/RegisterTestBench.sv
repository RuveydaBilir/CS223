`timescale 1ns / 1ps
module RegisterTestBench();
    logic clk, reset, shift_in;
    logic [3:0] d; 
    logic [1:0] s;
    logic [3:0] q;
MRegister dut(clk,reset,shift_in,d,s,q);

initial begin
        clk = 0;
        d=4'b0111;
        shift_in = 0;
        reset = 1;
        s=2'b00;
        
        #5 reset = 0;
           
        s = 2'b01;
        d = 1111; #100; 
        
        s = 2'b10;
        d = 1001; #100;
        d = 0011; #100;
        d = 1100; #100;
        
        s = 2'b01;
        d = 1111; #100;
        
        s = 2'b11;
        d = 1001; #100;
        d = 0011; #100;
        d = 1100; #100;
        
        for(int j=0; j<16; j++)begin
                d = j;
                #100;
        end
        s=2'b01;
        
        for(int k=0; k<16; k++)begin
                d = k;
                #100;
            end
       s=2'b10;
       for(int l=0; l<16; l++)begin
                d = l;
                #100;
            end
       s=2'b11;
       for(int m=0; m<16; m++)begin
                d = m;
                #100;
            end
             
    end
    always #5 clk = ~clk;
endmodule
/*

        s = 2'b00;
        d = 4'b0001; #100;
        d = 4'b0101; #100;
        
        s = 2'b01;
        d = 4'b1010; #100;
        d = 4'b0001; #100;
        
        s = 2'b10;
        d = 4'b1111; #100;
        d = 4'b0000; #100; 
        
        s = 2'b11;
        d = 4'b1010; #100;
        d = 4'b0000; #100;
*/