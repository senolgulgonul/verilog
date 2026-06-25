`timescale 1ns/1ns
module tb;
  reg  clk;
  reg  b;
  wire a;
  wire c;
  integer i;
  blocking_example dut(.clk(clk), .b(b), .a(a), .c(c));
  initial clk=0;  always #5 clk=~clk;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    b=0;
    for(i=0;i<8;i=i+1) begin
      @(negedge clk) b=$random;
    end
    #20 $finish;
  end
endmodule
