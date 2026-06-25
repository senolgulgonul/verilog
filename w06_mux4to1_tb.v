`timescale 1ns/1ns
module tb;
  reg  SEL0;
  reg  SEL1;
  reg  A;
  reg  B;
  reg  C;
  reg  D;
  wire Y;
  integer i;
  mux4to1 dut(.SEL0(SEL0), .SEL1(SEL1), .A(A), .B(B), .C(C), .D(D), .Y(Y));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    $monitor("%0t : SEL0=%b SEL1=%b A=%b B=%b C=%b D=%b Y=%b", $time, SEL0, SEL1, A, B, C, D, Y);
    for(i=0;i<64;i=i+1) begin
      D = i[0];
      C = i[1];
      B = i[2];
      A = i[3];
      SEL1 = i[4];
      SEL0 = i[5];
      #10;
    end
    $finish;
  end
endmodule
