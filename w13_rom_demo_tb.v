`timescale 1ns/1ns
module tb;
  reg clk = 0;
  reg [2:0] addr;
  wire [5:0] leds;
  rom_demo dut(.clk(clk), .addr(addr), .leds(leds));
  always #5 clk = ~clk;
  integer i;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    for (i=0;i<8;i=i+1) begin addr=i; @(posedge clk); #1 $display("addr=%0d leds=%b", addr, leds); end
    $finish;
  end
endmodule
