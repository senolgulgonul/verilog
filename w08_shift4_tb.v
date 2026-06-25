`timescale 1ns/1ns
module tb;
  reg  clk;
  reg  rst;
  reg  din;
  wire [3:0] Q;
  integer i;
  shift4 dut(.clk(clk), .rst(rst), .din(din), .Q(Q));
  initial clk=0;  always #5 clk=~clk;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    rst=0;
    din=0;
    rst=1; #12; rst=0;
    for(i=0;i<8;i=i+1) begin
      @(negedge clk) din=$random;
    end
    #20 $finish;
  end
endmodule
