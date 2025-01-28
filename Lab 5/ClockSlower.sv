`timescale 1ns / 1ps

module ClockSlower(
    input clk,
    output reg slowClk
);
reg [31:0] timePass = 0;

always @(posedge clk) begin
    timePass <= timePass + 1;
    
    if(timePass == 300_000_000) begin
        timePass <= 0;
        slowClk <= ~slowClk;
    end
end

endmodule