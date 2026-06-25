`timescale 1ns/1ns
module tb;
    reg A, B;
    wire S, C;
    halfadder M0(.S(S), .C(C), .A(A), .B(B));   // named instantiation
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        $monitor("A=%b B=%b -> S=%b C=%b", A, B, S, C);
        A=0; B=0; #10; A=0; B=1; #10; A=1; B=0; #10; A=1; B=1; #10;
        $finish;
    end
endmodule
