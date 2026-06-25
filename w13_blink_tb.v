`timescale 1ns/1ns
module tb;
  reg clk = 0;
  wire led;
  blink #(.WAIT(2)) dut(.clk(clk), .led(led));   // WAIT=2 to simulate; board uses 2_700_000
  always #5 clk = ~clk;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    repeat (12) begin @(posedge clk); #1 $display("t=%0t led=%b", $time, led); end
    $finish;
  end
endmodule
