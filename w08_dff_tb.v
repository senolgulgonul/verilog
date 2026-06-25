`timescale 1ns/1ps
module tb;
    reg D, Clk; wire Q;
    DFF M0(.Q(Q), .D(D), .Clk(Clk));
    initial begin Clk = 0; forever #1 Clk = ~Clk; end   // 2 ns period
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        $monitor("t=%0t Clk=%b D=%b Q=%b", $time, Clk, D, Q);
        D=0; #3 D=1; #4 D=0; #4 D=1; #4 $finish;
    end
endmodule
