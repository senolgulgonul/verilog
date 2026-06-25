`timescale 1ns/1ns
module tb;
  reg  A;
  reg  B;
  reg  Ci;
  wire S;
  wire Co;
  integer i;
  fulladder dut(.S(S), .Co(Co), .A(A), .B(B), .Ci(Ci));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    $monitor("%0t : S=%b Co=%b A=%b B=%b Ci=%b", $time, S, Co, A, B, Ci);
    for(i=0;i<8;i=i+1) begin
      Ci = i[0];
      B = i[1];
      A = i[2];
      #10;
    end
    $finish;
  end
endmodule
