`timescale 1ns/1ns
module tb;
  reg  A;
  reg  B;
  reg  C;
  wire D;
  integer i;
  twoand dut(.D(D), .A(A), .B(B), .C(C));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    $monitor("%0t : D=%b A=%b B=%b C=%b", $time, D, A, B, C);
    for(i=0;i<8;i=i+1) begin
      C = i[0];
      B = i[1];
      A = i[2];
      #10;
    end
    $finish;
  end
endmodule
