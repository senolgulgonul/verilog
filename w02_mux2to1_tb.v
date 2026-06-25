`timescale 1ns/1ns
module tb;
    reg  a, b, s;
    wire y;
    mux2to1 M0(.Y(y), .A(a), .B(b), .S(s));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        $display("a b:s y");
        $monitor("%b %b:%b %b", a, b, s, y);
        a=0; b=1; s=0; #10;   // s=0 -> y follows a
        s=1;             #10;  // s=1 -> y follows b
        a=1; b=0; s=0;   #10;
        s=1;             #10;
        $finish;
    end
endmodule
