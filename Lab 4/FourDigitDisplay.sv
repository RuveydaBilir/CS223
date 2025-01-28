`timescale 1ns / 1ps
module FourDigitDisplay(
    input logic clk,
    input logic [15:0] w,
    output logic [0:6] seg,
    output logic [3:0] digit
);
reg [3:0] onesBCD;
reg [3:0] tensBCD;
reg [3:0] hundredsBCD;
reg [3:0] thousandsBCD;

reg [0:6] ones;
reg [0:6] tens;
reg [0:6] hundreds;
reg [0:6] thousands;

    FourDigits fd(clk,w,onesBCD,tensBCD,hundredsBCD,thousandsBCD);
    CodeConverter cc1(onesBCD,ones);
    CodeConverter cc10(tensBCD,tens);
    CodeConverter cc100(hundredsBCD,hundreds);
    CodeConverter cc1000(thousandsBCD,thousands);

reg [1:0] anode;     
reg [16:0] timer;
initial timer = 0;

    always @(posedge clk) begin                                       
        if(timer == 99_999) begin         
            timer <= 0;               
            anode <= anode + 1;
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
    
    always @ (anode) begin
       case(anode)
           2'b00: seg <= ones;
           2'b01: seg <= tens;
           2'b10: seg <= hundreds;
           2'b11: seg <= thousands;
           default: seg <=7'b1111110;
       endcase
   end
endmodule
