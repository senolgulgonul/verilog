`timescale 1ns/1ns
module tb;
  reg  [1:0] sel;
  reg  a;
  reg  b;
  reg  c;
  reg  d;
  wire y;
  integer i;
  bad_mux dut(.sel(sel), .a(a), .b(b), .c(c), .d(d), .y(y));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    $monitor("%0t : sel=%b a=%b b=%b c=%b d=%b y=%b", $time, sel, a, b, c, d, y);
    for(i=0;i<64;i=i+1) begin
      d = i[0];
      c = i[1];
      b = i[2];
      a = i[3];
      sel = i[5:4];
      #10;
    end
    $finish;
  end
endmodule
