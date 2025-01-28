`timescale 1ns / 1ps
module TB_LabMultiplier;
reg a0, b0;
wire c2, s2, s3, s4;
LabMultiplier uut(
.a0(a0), .b0(b0), .c2(c2), .s2(s2), .s3(s3), .s4(s4));
initial begin
#100 a0=0; b0=0;
#100 a0=0; b0=1;
#100 a0=1; b0=0;
#100 a0=1; b0=1;

end
endmodule
