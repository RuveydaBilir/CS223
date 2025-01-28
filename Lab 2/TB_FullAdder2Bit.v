`timescale 1ns / 1ps
module TB_FullAdder2Bit;
reg a0, b0, a1, b1;
wire Sum0, Sum1, Cout0, Cout1;
// Device Under Test
FullAdder2Bit dut (
.a0(a0), .b0(b0), .a1(a1), .b1(b1), .Sum0(Sum0), .Sum1(Sum1), .Cout1(Cout1)
);
initial begin
#10 a0=0; a1=0; b0=0; b1=0;
#10 a0=0; a1=0; b0=0; b1=1;
#10 a0=0; a1=0; b0=1; b1=0;
#10 a0=0; a1=0; b0=1; b1=1;
#10 a0=0; a1=1; b0=0; b1=0;
#10 a0=0; a1=1; b0=0; b1=1;
#10 a0=0; a1=1; b0=1; b1=0;
#10 a0=0; a1=1; b0=1; b1=1;
#10 a0=1; a1=0; b0=0; b1=0;
#10 a0=1; a1=0; b0=0; b1=1;
#10 a0=1; a1=0; b0=1; b1=0;
#10 a0=1; a1=0; b0=1; b1=1;
#10 a0=1; a1=1; b0=0; b1=0;
#10 a0=1; a1=1; b0=0; b1=1;
#10 a0=1; a1=1; b0=1; b1=0;
#10 a0=1; a1=1; b0=1; b1=1;
end
endmodule
