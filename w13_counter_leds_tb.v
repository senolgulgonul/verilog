`timescale 1ns/1ns
module tb;
  reg clk = 0;
  wire [5:0] count_leds, walk_leds;
  counter_leds #(.TICK(1)) C(.clk(clk), .leds(count_leds));   // tiny TICK for simulation
  shift_leds   #(.TICK(1)) S(.clk(clk), .leds(walk_leds));
  always #5 clk = ~clk;
  integer i;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    for (i=0;i<8;i=i+1) begin @(posedge clk); #1
      $display("t=%0t count=%b walk=%b", $time, ~count_leds, ~walk_leds); end
    $finish;
  end
endmodule
