`timescale 1ns/1ns
module tb;
  reg  D;
  reg  CLK;
  wire Q;
  integer i;
  DFF dut(.Q(Q), .D(D), .CLK(CLK));
  initial CLK=0;  always #5 CLK=~CLK;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    D=0;
    for(i=0;i<8;i=i+1) begin
      @(negedge CLK) D=$random;
    end
    #20 $finish;
  end
endmodule
