`timescale 1ns / 1ps
module SingleDisplayCounter(
    input logic clk,
    input logic enable,
    input logic load,
    input logic [3:0] w,
    output logic [0:6] seg,
    output logic [3:0] digit
);
reg [3:0] num;
initial num = w;
wire numBCD;

wire clk1sec;
BCDcounter bc(clk,clk1sec);
BCDConverter cc1(num,numBCD);

//this part updates the number back to 0 when it reaches 9:
always@ (posedge clk) begin
    if(enable) begin
        if(load) num <= w;
        else begin
            num = num+1;
            if (num > 9) num = 4'b0;
        end
   end
   else seg <= numBCD;
end 
endmodule
