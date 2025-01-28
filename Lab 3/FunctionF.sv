`timescale 1ns / 1ps
module FunctionF(
    input a,b,c,d,e,
    output f
    );
wire k,l,m,n;

Decoder2to4 dec1(a,e,1,k,l,m,n);
Mux8to1 mux1((~k),n,0,n,(~l),l,(~e),m,d,b,c,f);

endmodule
