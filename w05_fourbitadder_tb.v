`timescale 1ns/1ns
module tb;
    reg [3:0] A,B; reg C0; wire S0,S1,S2,S3,C4;
    fourbitadder M0(.S0(S0),.S1(S1),.S2(S2),.S3(S3),.C4(C4),
        .A0(A[0]),.A1(A[1]),.A2(A[2]),.A3(A[3]),
        .B0(B[0]),.B1(B[1]),.B2(B[2]),.B3(B[3]),.C0(C0));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        A=4'b1111; B=4'b0000; C0=0; #30;
        B=4'b0001;             #30;   // forces carry to ripple 0->1->2->3
        $finish;
    end
endmodule
