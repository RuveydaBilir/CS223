`timescale 1ns / 1ps
module debouncer(
    input clk, B,
    output reg db
    );

integer counter = 0;

typedef enum logic [1:0] {init, dbState, delay} st;
st [1:0] curState;

always_ff@(posedge clk) begin
    case(curState)
        init: begin
            db<=1'b0;
            if(B) begin 
                counter <=0;
                curState <=dbState;
            end
            else if(!B) curState <= init;
        end
        dbState: begin
            counter <= counter+1;
            if(counter >= 20_000) begin
                db<=1'b1;
                curState<=delay;
            end
       end
       delay: begin
            if(B) db<=1'b0; 
            else curState<=init;
       end
       
       default: curState<=init;
       endcase
end
endmodule
