`timescale 1ns/1ns
module tb;
    reg A,B,C; wire Y;
    hazard M0(.Y(Y),.A(A),.B(B),.C(C));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        $monitor("t=%0t A=%b B=%b C=%b -> Y=%b", $time, A,B,C,Y);
        B=1; C=1; A=1; #20;   // Y=1
        A=0;          #20;     // A falls: Y should stay 1 but glitches low
        $finish;
    end
endmodule
