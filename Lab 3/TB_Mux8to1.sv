`timescale 1ns / 1ps
module TB_Mux8to1;
    reg d0,d1,d2,d3,d4,d5,d6,d7,s2,s1,s0;
    wire y;
Mux8to1 dut(.d0(d0), .d1(d1), .d2(d2), .d3(d3), .d4(d4), .d5(d5), .d6(d6), .d7(d7), .s2(s2), .s1(s1), .s0(s0), .y(y) );

initial
    for(int i=0; i<2; i++)begin
        for(int k=0; k<2; k++)begin
            for(int l=0; l<2; l++)begin
                for(int m=0; m<2; m++)begin
                    for(int n=0; n<2; n++)begin
                        for(int o=0; o<2; o++)begin
                            for(int p=0; p<2; p++)begin
                                for(int r=0; r<2; r++)begin
                                    for(int j=0; j<2; j++)begin
                                        for(int s=0; s<2; s++)begin
                                            for(int t=0; t<2; t++)begin
                                                #10 d0=t; d1=s; d2=j; d3=r; d4=p; d5=o; d6=n; d7=m; s2=l; s1=k; s0=i;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end                             
endmodule
