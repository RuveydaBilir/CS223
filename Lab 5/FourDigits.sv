`timescale 1ns / 1ps
module FourDigits(
    input logic clk,
    input logic [15:0] number,
    output logic [3:0] ones,
    output logic [3:0] tens,
    output logic [3:0] hundreds,
    output logic [3:0] thousands
);

//Get the digits
always @(posedge clk) begin
    ones <= number[3:0];
    tens <= number[7:4];
    hundreds <=  number[11:8];
    thousands <= number[15:12];
end    
endmodule
/*

    always @(posedge clk)
        if(reset)
            ones <= 0;
        else
            if(ones == 9)
                ones <= 0;
            else
                ones <= ones + 1;
         
    // tens reg control       
    always @(posedge clk)
        if(reset)
            tens <= 0;
        else
            if(ones == 9)
                if(tens == 9)
                    tens <= 0;
                else
                    tens <= tens + 1;
      
    // hundreds reg control              
    always @(posedge clk)
        if(reset)
            hundreds <= 0;
        else
            if(tens == 9 && ones == 9)
                if(hundreds == 9)
                    hundreds <= 0;
                else
                    hundreds <= hundreds + 1;
     
    // thousands reg control                
    always @(posedge clk)
        if(reset)
            thousands <= 0;
        else
            if(hundreds == 9 && tens == 9 && ones == 9)
                if(thousands == 9)
                    thousands <= 0;
                else
                    thousands <= thousands + 1;
*/