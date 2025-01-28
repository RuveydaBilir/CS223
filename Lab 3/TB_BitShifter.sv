`timescale 1ns / 1ps
module TB_BitShifter;
    reg shift,w3,w2,w1,w0;
    wire y3,y2,y1,y0,k;
BitShifter uut(.shift(shift), .w3(w3), .w2(w2), .w1(w1), .w0(w0), .y3(y3), .y2(y2), .y1(y1), .y0(y0), .k(k));

initial begin
#20 shift=1; w3=0;w2=0;w1=0;w0=0;
#20 shift=1; w3=0;w2=0;w1=0;w0=1;
#20 shift=1; w3=0;w2=0;w1=1;w0=0;
#20 shift=1; w3=0;w2=0;w1=1;w0=1;
#20 shift=1; w3=0;w2=1;w1=0;w0=0;
#20 shift=1; w3=0;w2=1;w1=0;w0=1;
#20 shift=1; w3=0;w2=1;w1=1;w0=0;
#20 shift=1; w3=0;w2=1;w1=1;w0=1;

#20 shift=1; w3=1;w2=0;w1=0;w0=0;
#20 shift=1; w3=1;w2=0;w1=0;w0=1;
#20 shift=1; w3=1;w2=0;w1=1;w0=0;
#20 shift=1; w3=1;w2=0;w1=1;w0=1;
#20 shift=1; w3=1;w2=1;w1=0;w0=0;
#20 shift=1; w3=1;w2=1;w1=0;w0=1;
#20 shift=1; w3=1;w2=1;w1=1;w0=0;
#20 shift=1; w3=1;w2=1;w1=1;w0=1;

//shift=0
#20 shift=0; w3=0;w2=0;w1=0;w0=0;
#20 shift=0; w3=0;w2=0;w1=0;w0=1;
#20 shift=0; w3=0;w2=0;w1=1;w0=0;
#20 shift=0; w3=0;w2=0;w1=1;w0=1;
#20 shift=0; w3=0;w2=1;w1=0;w0=0;
#20 shift=0; w3=0;w2=1;w1=0;w0=1;
#20 shift=0; w3=0;w2=1;w1=1;w0=0;
#20 shift=0; w3=0;w2=1;w1=1;w0=1;

#20 shift=0; w3=1;w2=0;w1=0;w0=0;
#20 shift=0; w3=1;w2=0;w1=0;w0=1;
#20 shift=0; w3=1;w2=0;w1=1;w0=0;
#20 shift=0; w3=1;w2=0;w1=1;w0=1;
#20 shift=0; w3=1;w2=1;w1=0;w0=0;
#20 shift=0; w3=1;w2=1;w1=0;w0=1;
#20 shift=0; w3=1;w2=1;w1=1;w0=0;
#20 shift=0; w3=1;w2=1;w1=1;w0=1;
end
endmodule
