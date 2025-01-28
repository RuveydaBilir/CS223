`timescale 1ns / 1ps
module TrafficLight(
    input clk, reset, Sa, Sb,
    output [2:0] La_out,
    output [2:0] Lb_out
);
reg [2:0] state, next;
reg [1:0] La;
reg [1:0] Lb;
wire slowClk;

ClockSlower cs(clk,slowClk);

parameter s0 = 3'b000;
parameter s1 = 3'b001;
parameter s2 = 3'b010;
parameter s3 = 3'b011;
parameter s4 = 3'b100;
parameter s5 = 3'b101;
parameter s6 = 3'b110;
parameter s7 = 3'b111;

always @ (posedge clk or posedge reset)begin
    if(reset) state <= s0;
    else state <= next;
end

always @ (*) begin
    case(state)
        s0: next = (s0&Sa)|(s1&~Sa);
        s1: next = s2;
        s2: next = s3;
        s3: next = s4;
        s4: next = (s4&Sb)|(s5&~Sb);
        s5: next = s6;
        s6: next = s7;
        s7: next = s0;
        default: next = s0;
    endcase
end

always @ (*) begin
    La[1] <= (state==s0);
    La[0] <= (state==s1)|(state==s7);
    Lb[1] <= (state==s4);
    Lb[0] <= (state==s3)|(state == s5);  
end

assign La_out[2] = 1;
assign La_out[1] = (La[0]==0);
assign La_out[0] = (La[0]==0 & La[1]==0);
assign Lb_out[2] = 1;
assign Lb_out[1] = (Lb[0]==0);
assign Lb_out[0] = (Lb[0]==0 & Lb[1]==0); 
endmodule
