`timescale 1ns/1ns
module tb;
  reg clk = 0;
  reg start = 0;
  reg [7:0] data = 8'h41;          // 'A'
  wire tx, busy;
  uart_tx #(.DIV(2)) dut(.clk(clk), .start(start), .data(data), .tx(tx), .busy(busy)); // DIV=2 to simulate
  always #5 clk = ~clk;
  integer k;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    @(negedge clk) start = 1; @(posedge clk); @(negedge clk) start = 0;
    for (k=0;k<11;k=k+1) begin repeat (2) @(posedge clk); #1
      $display("bit %0d: tx=%b busy=%b", k, tx, busy); end
    $finish;
  end
endmodule
