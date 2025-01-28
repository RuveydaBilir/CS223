`timescale 1ns / 1ps
module functionG(
    input w1, w2, w3,
    output g
    );
wire wire1, wire2;
Mux2to1 mux1(0,w3,w2,wire1);
Mux2to1 mux2(w3,1,w2,wire2);
Mux2to1 mux3(wire1,wire2,w1,g);
endmodule
