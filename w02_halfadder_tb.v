`timescale 1ns/1ns
module tb;
    reg  a, b;          // reg for inputs
    wire s, c;          // wire for outputs
    halfadder M0(.S(s), .C(c), .A(a), .B(b));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        $display("ab:cs");
        $monitor("%b%b:%b%b", a, b, c, s);
        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;
        $finish;
    end
endmodule
