`timescale 1ns/1ns
module tb;
  reg  [3:0] a;
  reg  b;
  wire [3:0] sum;
  wire carry;
  integer i;
  adder_4bit_simple dut(.a(a), .b(b), .sum(sum), .carry(carry));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    $monitor("%0t : a=%b b=%b sum=%b carry=%b", $time, a, b, sum, carry);
    for(i=0;i<32;i=i+1) begin
      b = i[0];
      a = i[4:1];
      #10;
    end
    $finish;
  end
endmodule
