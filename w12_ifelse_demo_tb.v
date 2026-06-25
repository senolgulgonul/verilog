`timescale 1ns/1ns
module tb;
  reg s1;
  wire [5:0] leds;
  ifelse_demo dut(.s1(s1), .leds(leds));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    s1=1; #1 $display("s1=%b leds=%b", s1, leds);
    s1=0; #1 $display("s1=%b leds=%b", s1, leds);
    $finish;
  end
endmodule
