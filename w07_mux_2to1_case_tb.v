`timescale 1ns/1ns
module tb;
  reg  a;
  reg  b;
  reg  sel;
  wire y;
  integer i;
  mux_2to1_case dut(.a(a), .b(b), .sel(sel), .y(y));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    $monitor("%0t : a=%b b=%b sel=%b y=%b", $time, a, b, sel, y);
    for(i=0;i<8;i=i+1) begin
      sel = i[0];
      b = i[1];
      a = i[2];
      #10;
    end
    $finish;
  end
endmodule
