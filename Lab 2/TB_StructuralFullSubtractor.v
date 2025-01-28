`timescale 1ns / 1ps
module TB_StructuralFullSubtractor;
reg A, B, Bin;
wire D, Bout;
// Device Under Test
StructuralFullSubtractor dut (
.A(A), .B(B), .Bin(Bin), .D(D), .Bout(Bout)
);
initial begin
#100 A = 1'b0; B = 1'b0; Bin = 1'b0;
#100 A = 1'b0; B = 1'b0; Bin = 1'b1;
#100 A = 1'b0; B = 1'b1; Bin = 1'b0;
#100 A = 1'b0; B = 1'b1; Bin = 1'b1;
#100 A = 1'b1; B = 1'b0; Bin = 1'b0;
#100 A = 1'b1; B = 1'b0; Bin = 1'b1;
#100 A = 1'b1; B = 1'b1; Bin = 1'b0;
#100 A = 1'b1; B = 1'b1; Bin = 1'b1;
end
initial $monitor("Time=%0t A=%b, B=%b, Bin=%b, D=%b, Bout=%b", $time, A, B, Bin, D, Bout);
endmodule
