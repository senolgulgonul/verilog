`timescale 1ns/1ns
module tb;
  reg  SEL;
  reg  A;
  reg  B;
  wire Y;
  integer i;
  mux2to1 dut(.SEL(SEL), .A(A), .B(B), .Y(Y));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    $monitor("%0t : SEL=%b A=%b B=%b Y=%b", $time, SEL, A, B, Y);
    for(i=0;i<8;i=i+1) begin
      B = i[0];
      A = i[1];
      SEL = i[2];
      #10;
    end
    $finish;
  end
endmodule
