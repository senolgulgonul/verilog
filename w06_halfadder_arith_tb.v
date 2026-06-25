`timescale 1ns/1ns
module tb;
    reg A,B; wire C,S; integer i;
    halfadder_arith M0(.C(C), .S(S), .A(A), .B(B));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        $display("AB:CS");
        for (i=0;i<4;i=i+1) begin {A,B}=i; #10; $display("%b%b:%b%b",A,B,C,S); end
        $finish;
    end
endmodule
