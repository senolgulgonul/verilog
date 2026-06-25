`timescale 1ns/1ns
module tb;
  reg s1, s2;
  wire [5:0] leds;
  case_demo dut(.s1(s1), .s2(s2), .leds(leds));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    s1=1; s2=1; #1 $display("sel=00 leds=%b", leds);
    s1=1; s2=0; #1 $display("sel=01 leds=%b", leds);
    s1=0; s2=1; #1 $display("sel=10 leds=%b", leds);
    s1=0; s2=0; #1 $display("sel=11 leds=%b", leds);
    $finish;
  end
endmodule
