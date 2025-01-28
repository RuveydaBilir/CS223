`timescale 1ns / 1ps
module TwoDigitCounter(
    input logic clk,
    input logic enable,
    input logic load,
    input logic [7:0] w,
    output logic [0:6] seg,
    output logic [3:0] digit
);
reg [3:0] digit1;
reg [3:0] digit2;
reg [7:0] num;

SingleDisplayCounter sdc1(clk,enable,load,w,seg,digit);
SingleDisplayCounter sdc2(clk,enable,load,w,seg,digit);

reg [1:0] anode;     
reg [16:0] timer;
    initial timer = 0;

    always @(posedge clk) begin                                       
        if(timer == 99_999) begin         
            timer <= 0;               
            anode <= anode + 1;
            if(anode>2) anode <=0;
        end
        else
            timer <= timer + 1;
    end
    
    always @(anode) begin
        case(anode) 
            2'b00 : digit = 4'b1110;   
            2'b01 : digit = 4'b1101;   
            2'b10 : digit = 4'b1011;   
            2'b11 : digit = 4'b0111;   
            default: digit = 4'b1110;
        endcase
    end

endmodule
