module mips_tb();
    `timescale  1ns/1ps
    reg clk;
    reg rst;
    initial
    begin
        clk=1;
        rst = 0;
        #2000
        rst = 1;
        #2000
        rst = 0;
    end
    always
    begin
        #20 clk<=~clk;
    end
    mips my_mips(clk,rst);
endmodule
