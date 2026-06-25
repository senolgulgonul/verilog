`timescale 1ns/1ns
module tb;
    reg A,B,Ci; wire S,Co;
    fulladder M0(.S(S),.Co(Co),.A(A),.B(B),.Ci(Ci));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        $monitor("t=%0t A=%b B=%b Ci=%b -> Co=%b S=%b", $time, A,B,Ci,Co,S);
        A=0;B=0;Ci=0; #20;
        A=1;B=1;Ci=0; #20;   // watch S, Co settle a few ns after the change
        A=1;B=1;Ci=1; #20;
        $finish;
    end
endmodule
