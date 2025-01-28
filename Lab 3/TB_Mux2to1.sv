`timescale 1ns / 1ps

module TBMux2to1;
    reg d0, d1, s;
    wire y;

Mux2to1 uut(.d0(d0), .d1(d1), .s(s), .y(y));

initial begin
    #100 d0=0;d1=0;s=0;
    #100 d0=0;d1=1;s=0;
    #100 d0=1;d1=0;s=0;
    #100 d0=1;d1=1;s=0;
    #100 d0=0;d1=0;s=1;
    #100 d0=0;d1=1;s=1;
    #100 d0=1;d1=0;s=1;
    #100 d0=1;d1=1;s=1;  
end

endmodule