`timescale 1ns/1ns
module tb;
    reg  [3:0] A, B; reg C0;
    wire S0,S1,S2,S3,C4;
    integer i, errors = 0; reg [4:0] expect;
    fourbitadder M0(.S0(S0),.S1(S1),.S2(S2),.S3(S3),.C4(C4),
                    .A0(A[0]),.A1(A[1]),.A2(A[2]),.A3(A[3]),
                    .B0(B[0]),.B1(B[1]),.B2(B[2]),.B3(B[3]),.C0(C0));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        for (i=0;i<20;i=i+1) begin
            A=$random; B=$random; C0=$random;
            #5 expect = A + B + C0;
            if ({C4,S3,S2,S1,S0} !== expect) begin
                $display("FAIL %0d+%0d+%0d=%0d", A,B,C0,expect); errors=errors+1; end
        end
        if (errors==0) $display("ALL %0d RANDOM TESTS PASSED", i);
        else           $display("%0d FAILED", errors);
        $finish;
    end
endmodule
