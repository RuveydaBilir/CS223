`timescale 1ns / 1ps
module MRegister(
    input logic clk, reset, shift_in,
    input logic [3:0] d,
    input logic [1:0] s,
    output logic [3:0] q
);

reg [3:0] temp;
wire w3,w2,w1,w0;
wire t3,t2,t1,t0;


Mux4to1 mux0(q[0], d[0], shift_in, q[1], s, w0);
Mux4to1 mux1(q[1], d[1], q[0], q[2], s, w1);
Mux4to1 mux2(q[2], d[2], q[1], q[3], s, w2);
Mux4to1 mux3(q[3], d[3], q[2], shift_in, s, w3);

DFlipFlopR ff3(clk,reset,w3,t3);
DFlipFlopR ff2(clk,reset,w2,t2);
DFlipFlopR ff1(clk,reset,w1,t1);
DFlipFlopR ff0(clk,reset,w0,t0);

assign temp = {t3,t2,t1,t0};

always_ff @(posedge clk) begin  
    if(reset) q <= 4'b0; 
    else begin
        case(s)
            2'b00: q <= q;
            2'b01: q <= d;
            2'b10: q <= temp;
            2'b11: q <= temp;
            default: q <= temp;
        endcase
    end
end

endmodule


/*module MRegister(
    input logic clk, reset, shift_in,
    input logic [3:0] d,
    input logic [1:0] s,
    output logic [3:0] q
);
wire w3,w2,w1,w0;
logic [3:0] temp;

Mux4to1 mux0(q[0],d[0],shift_in,q[1],s,w0);
Mux4to1 mux1(q[1],d[1],q[0],q[2],s,w1);
Mux4to1 mux2(q[2],d[2],q[1],q[3],s,w2);
Mux4to1 mux3(q[3],d[3],q[2],shift_in,s,w3);

DFlipFlopR ff3(clk, reset, temp[3], q[3]);
DFlipFlopR ff2(clk, reset, temp[2], q[2]);
DFlipFlopR ff1(clk, reset, temp[1], q[1]);
DFlipFlopR ff0(clk, reset, temp[0], q[0]);
always_ff@(posedge clk)
    if(reset) q <= 4'b0;
    else 
        q <= temp;
        
endmodule
*/