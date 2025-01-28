`timescale 1ns / 1ps
module LabMultiplier(
    input a0, b0,
    output c2, s2, s3, s4
    );
wire s0, s1, c0, c1;
FullAdder_Bit fab1(a0,b0,a0,b0,s1,s0,c0);
FullAdder_Bit fab2(a0,b0,s1,s0,s3,s2,c1);
StructuralFullAdder sfa(c0,c1,0,s4,c2);

endmodule

module FullAdder_Bit(
input a0, b0, a1, b1,
output Sum0, Sum1, Cout1
    );
wire Cout0;
StructuralFullAdder fullAdder1(a0, a1, 0, Sum0, Cout0);
StructuralFullAdder fullAdder2(b0, b1, Cout0, Sum1, Cout1);
endmodule

