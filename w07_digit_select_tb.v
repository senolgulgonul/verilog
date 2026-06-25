`timescale 1ns/1ns
module tb;
  reg  A;
  wire [3:0] B;
  integer i;
  digit_select dut(.A(A), .B(B));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    $monitor("%0t : A=%b B=%b", $time, A, B);
    for(i=0;i<2;i=i+1) begin
      A = i[0];
      #10;
    end
    $finish;
  end
endmodule
