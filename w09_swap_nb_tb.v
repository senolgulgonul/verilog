`timescale 1ns/1ns
module tb;
  reg  clk;
  reg  [3:0] init_x;
  reg  init_y;
  reg  load;
  wire [3:0] x;
  wire y;
  integer i;
  swap_nb dut(.clk(clk), .init_x(init_x), .init_y(init_y), .load(load), .x(x), .y(y));
  initial clk=0;  always #5 clk=~clk;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    init_x=0;
    init_y=0;
    load=0;
    for(i=0;i<8;i=i+1) begin
      @(negedge clk) init_x=$random;
      @(negedge clk) init_y=$random;
      @(negedge clk) load=$random;
    end
    #20 $finish;
  end
endmodule
