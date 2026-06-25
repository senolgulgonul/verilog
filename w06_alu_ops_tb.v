`timescale 1ns/1ns
module tb;
  reg  [3:0] A;
  reg  B;
  wire [3:0] sum;
  wire diff;
  wire and_all;
  wire lt;
  integer i;
  alu_ops dut(.sum(sum), .diff(diff), .and_all(and_all), .lt(lt), .A(A), .B(B));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    $monitor("%0t : sum=%b diff=%b and_all=%b lt=%b A=%b B=%b", $time, sum, diff, and_all, lt, A, B);
    for(i=0;i<32;i=i+1) begin
      B = i[0];
      A = i[4:1];
      #10;
    end
    $finish;
  end
endmodule
