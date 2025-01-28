`timescale 1ns / 1ps
module divClk(
    input clk,
    input [31:0] value,
    output divClk
    );
reg slowClk = 0;
integer cnt = 0;

always_ff@(posedge clk) begin
    cnt<=cnt+1;
    if(cnt>=value) begin
        cnt<=0;
        slowClk<=~slowClk;
    end
end

assign divClk = slowClk;
endmodule
