`timescale 1 ns / 1 ns
`include "mux21_case.v"
module testbench;
  reg a,b,sel; //inputs
  wire y; //outputs
//intantiate  
mux_2to1_case M0 (.SEL(sel),.A(a),.B(b),.Y(y));
initial begin
  $dumpfile("dump.vcd"); $dumpvars;
  $display("a b:sel y");
  $monitor("%0t %b %b:%b %b", $time, a,b,sel,y);
    #10 a= 0; b= 1; sel = 1;
    #10 sel = 0;
    #10 $finish;
end
endmodule
