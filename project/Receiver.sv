`timescale 1ns / 1ps
module Receiver#(parameter bitNum=8)(
    input clk, 
    logic t, //reset, t,
	output reg isSuccessful,
	output reg [bitNum-1:0] R_reg,
	output reg [3:0][bitNum-1:0] mem
    );
localparam stopBit = 1'b1;
localparam baudRate = 9600;
localparam freq = 100_000_000;
localparam baudClock = freq/baudRate;

typedef enum logic {init, rec} typename;
typename curState;

reg [3:0] counter = 0;
reg [bitNum-1:0] T_reg;
wire slowClk;

//initial R = 8'b0;
initial mem = 0;

divClk clk1(clk, baudClock, slowClk);

always_ff@(posedge slowClk) begin
    //if(reset) begin ....
    case (curState)
        init: begin
            isSuccessful <=0;
            T_reg<=8'b0;
            counter <= 0;
            
            if(t == 1'b0) curState <= rec;
        end
        rec: begin
            T_reg[counter] <= t;
            counter <= counter +1;
            if(counter == 9) begin
                isSuccessful <=1;
                R_reg<=T_reg;
                mem[0] <= T_reg;
                mem[1] <= mem[0];
                mem[2] <= mem[1];
                mem[3] <= mem[2];
                curState<=init;
            end
       end
       default: curState <= init;
    endcase
    end
endmodule
