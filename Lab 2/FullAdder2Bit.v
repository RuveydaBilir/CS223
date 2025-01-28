`timescale 1ns / 1ps
module StructuralFullAdder (
input A, B, Cin,
output Sum, Cout
);
wire w1, w2, w3;
and and1(w2, w1, Cin);
and and2(w3, A, B);
xor xor1(w1, A, B);
xor xor2(Sum, w1, Cin);
or or1(Cout, w2, w3);
endmodule

module FullAdder2Bit(
input a0, b0, a1, b1, Cin,
output Sum0, Sum1, Cout1
    );
wire Cout0;
StructuralFullAdder fullAdder1(a0, b0, 0, Sum0, Cout0);
StructuralFullAdder fullAdder2(a1, b1, Cout0, Sum1, Cout1);
endmodule
