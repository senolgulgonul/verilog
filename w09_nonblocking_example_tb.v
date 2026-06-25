`timescale 1ns/1ps
module tb;
    reg clk, b; wire a, c;
    nonblocking_example DUT(.clk(clk), .b(b), .a(a), .c(c));
    initial begin clk = 0; forever #1 clk = ~clk; end
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        $monitor("t=%0t b=%b a=%b c=%b", $time, b, a, c);
        b=0; #3 b=1; #6 b=0; #6 $finish;
    end
endmodule
