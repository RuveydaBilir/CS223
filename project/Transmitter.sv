`timescale 1ns / 1ps
module Transmitter#(parameter bitNum=8)(
    input clk, //reset,
    input stage4,
    input [bitNum-1:0] lData,
    input LButton, 
    input transferButton,
    output reg isSuccessful,
    output reg t,
    output reg [bitNum-1:0] t_buf,
    output reg [3:0][bitNum-1:0] mem  
    );
localparam stop = 1'b1;
localparam start = 1'b0;
localparam baudRate = 9600;
localparam freq = 100_000_000;
localparam baudClock = freq/baudRate;

reg [3:0] counter = 0;
reg [1:0] stage4Counter = 0;
reg [bitNum+1:0] T_reg = 0;
wire slowClk;

//initial counter =0; 
//initial T_reg =0;
//initial t = 1'b1;

typedef enum logic [2:0] {init,loadS,transfer, wait_load,wait_transfer, action, stage4State} typename;
typename curState;

divClk clk1(clk, baudClock, slowClk);

always_ff@(posedge slowClk) begin
    case (curState)
        init: begin
            t <= 1;
            isSuccessful <=0;
            counter <=0;
            stage4Counter<=0;
            if(LButton && ~stage4) begin
                t_buf <= lData;
                mem[0] <= lData;
                mem[1] <= mem[0];
                mem[2] <= mem[1];
                mem[3] <= mem[2];
                curState <= loadS;
           end
           if(transferButton) begin
                if(stage4) curState<=stage4State;
                else begin
                    curState <= transfer;
                    counter<=0;
                end
           end
       end
       loadS: begin
               T_reg <= {stop,mem[3],start};
               curState<=wait_load;
        end
       
       transfer: begin
            t<=T_reg[counter];
            counter <= counter+1;
            if(counter == 9)begin
                isSuccessful <=1;
                curState <= wait_transfer;
            end
       end
       
       wait_load: if(!LButton) curState<=init;
       wait_transfer: begin
            if(~transferButton && ~stage4) curState<=init;
            if(stage4) begin
                if(stage4Counter <3) begin
                    stage4Counter <= stage4Counter +1;
                    counter <=0;
                    curState <= stage4State;
                end
                else if(~transferButton) curState<= init;
           end
       
       end
       stage4State: begin
            if(stage4Counter<4) begin
                T_reg <= {stop, mem[3-stage4Counter], start};
                curState <= transfer;
            end
            else curState<=init;
       end
       
       default: curState <=init;
    endcase
end
endmodule

