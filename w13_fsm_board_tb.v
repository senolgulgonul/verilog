`timescale 1ns/1ns
module tb;
  reg clk = 0;
  reg button3 = 1, button4 = 1;   // 1 = not pressed (active-low)
  wire [5:0] led;
  fsm_board dut(.clk(clk), .button3(button3), .button4(button4), .led(led));
  always #5 clk = ~clk;
  task press(input v); begin button3 = v; @(posedge clk); #1
    $display("button3=%b led=%b", button3, led); end endtask
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    @(posedge clk); #1 $display("init     led=%b", led);
    press(0); press(1); press(0); press(1); press(1);   // press,release,press,release
    $finish;
  end
endmodule
