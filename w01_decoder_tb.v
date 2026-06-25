`timescale 1ns/1ns
module tb;
  reg  A0;
  reg  A1;
  reg  G;
  wire Y0;
  wire Y1;
  wire Y2;
  wire Y3;
  integer i;
  decoder dut(.Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3), .A0(A0), .A1(A1), .G(G));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    $monitor("%0t : Y0=%b Y1=%b Y2=%b Y3=%b A0=%b A1=%b G=%b", $time, Y0, Y1, Y2, Y3, A0, A1, G);
    for(i=0;i<8;i=i+1) begin
      G = i[0];
      A1 = i[1];
      A0 = i[2];
      #10;
    end
    $finish;
  end
endmodule
