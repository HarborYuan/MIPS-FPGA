module mips_tb();
    `timescale  1ns/1ps
    reg clk;
    reg rst;
    initial
    begin
        clk=1;
        clk=0;
    end
    always
    begin
        #20 clk<=~clk;
    end
    mips my_mips(clk,rst);
endmodule
