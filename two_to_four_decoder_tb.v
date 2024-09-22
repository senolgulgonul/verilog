//testbench
`timescale 1 ns / 1 ns
module testbench;
  wire y0,y1,y2,y3; //wire for outputs
  reg  a0,a1,g;  	//reg for inputs
  //instantiation
  decoder M0 (.Y0(y0),.Y1(y1),.Y2(y2),.Y3(y3),
              .A0(a0),.A1(a1),.G(g));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    $display("GA1A0 : Y0Y1Y2Y3");
    $monitor("%b %b %b : %b %b %b %b"
             ,g,a1,a0,y0,y1,y2,y3);
    #1 g=1; a1=0; a0=0;
    #1 g=1; a1=0; a0=1;
    #1 g=1; a1=1; a0=0;
    #1 g=1; a1=1; a0=1;
    #1 g=0; a1=0; a0=0; 
    #1 g=0; a1=0; a0=1; 
    #10 $finish;
  end // initial
endmodule
