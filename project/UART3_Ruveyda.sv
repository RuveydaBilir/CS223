`timescale 1ns / 1ps
module UART3_Ruveyda#(parameter bitNum=8)(
    input clk, //reset,
    input btnU,
    input btnR,
    input btnL,
    input stage4,
    input [bitNum-1:0] data,
    input btnC, //for load operation
    input btnD, //for transmit operation
    input R,
    output T,
    output reg [bitNum-1:0] T_Buf,
    output reg [bitNum-1:0] R_Buf,
    output reg [3:0] an,
    output reg [6:0] seg
);
wire isSuccessfulT,isSuccessfulR;
wire dbU,dbR,dbL;
reg [3:0][bitNum-1:0] memT;
reg [3:0][bitNum-1:0] memR;

debouncer db1(clk,btnU,dbU);
debouncer db2(clk,btnR,dbR);
debouncer db3(clk,btnL,dbL);

reg isT;
reg [7:0] RorT;
reg [1:0] index;
reg [3:0][bitNum-1:0] arr;

initial index=0;
initial isT = 1;

Transmitter t(clk,stage4,data,btnC,btnD,isSuccessfulT,T,T_Buf,memT);
Receiver r(clk,R,isSuccessfulR,R_Buf,memR);

always@(posedge clk) begin
    if(dbU) begin
        index <=0;
        if(isT) isT<=0;
        else isT<=1;
    end
    if(isT) begin
        RorT <= 4'hA; //A disinda bi harf ata
        if(dbR)begin
            if(index >3) index <=0;
            else index <= index+1;
        end
        else begin
            if(dbL) begin
                if(index<0) index <=3;
                else index <= index-1;
            end
       end
       arr <= memT;
   end
   else begin
        RorT <= 4'hb; //b disinda bisey yazdir
        if(dbR)begin
            if(index >3) index <=0;
            else index <= index+1;
        end
        else begin
            if(dbL) begin
                if(index<0) index <=3;
                else index <= index-1;
            end
       end
       arr <= memR;
   end
end   

DigitDisplay d(clk,RorT,index,arr[index][7:4],arr[index][3:0],an,seg);

endmodule
