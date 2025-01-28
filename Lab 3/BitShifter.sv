`timescale 1ns / 1ps
module BitShifter(
    input shift,w3,w2,w1,w0,
    output y3,y2,y1,y0,k
    );
Mux2to1 mux1(w3,0,shift,y3);
Mux2to1 mux2(w2,w3,shift,y2);
Mux2to1 mux3(w1,w2,shift,y1);
Mux2to1 mux4(w0,w1,shift,y0);
Mux2to1 mux5(0,w0,shift,k);
endmodule
