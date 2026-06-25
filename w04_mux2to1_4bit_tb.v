`timescale 1ns/1ns
module tb;
  reg  [3:0] A;
  reg  B;
  reg  S;
  wire [3:0] Y;
  integer i;
  mux2to1_4bit dut(.Y(Y), .A(A), .B(B), .S(S));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    $monitor("%0t : Y=%b A=%b B=%b S=%b", $time, Y, A, B, S);
    for(i=0;i<64;i=i+1) begin
      S = i[0];
      B = i[1];
      A = i[5:2];
      #10;
    end
    $finish;
  end
endmodule
