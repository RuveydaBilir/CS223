`timescale 1ns / 1ps
module TB_functionG;
    reg w1,w2,w3;
    wire g;
    
functionG uut(.w1(w1), .w2(w2), .w3(w3), .g(g));

initial begin
#100 w1=0; w2=0; w3=0;
#100 w1=0; w2=0; w3=1;
#100 w1=0; w2=1; w3=0;
#100 w1=0; w2=1; w3=1;
#100 w1=1; w2=0; w3=0;
#100 w1=1; w2=0; w3=1;
#100 w1=1; w2=1; w3=0;
#100 w1=1; w2=1; w3=1;
end
endmodule
