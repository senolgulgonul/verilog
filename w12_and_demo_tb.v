`timescale 1ns/1ns
module tb;
  reg s1, s2;
  wire led;
  and_demo dut(.s1(s1), .s2(s2), .led(led));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    $display("s1 s2 | led (0 = lit)");
    s1=1; s2=1; #1 $display(" %b  %b |  %b", s1, s2, led);
    s1=1; s2=0; #1 $display(" %b  %b |  %b", s1, s2, led);
    s1=0; s2=1; #1 $display(" %b  %b |  %b", s1, s2, led);
    s1=0; s2=0; #1 $display(" %b  %b |  %b", s1, s2, led);
    $finish;
  end
endmodule
