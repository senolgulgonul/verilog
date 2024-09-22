//testbench
`timescale 1 ns / 1 ns
module tb_twogates ();
  reg  a,b;  //reg for inputs
  wire c,d;    //wire for outputs
  //instantiation
  twogates M0 (.C(c),.D(d),.A(a),.B(b));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    $display("ab:cd");
    $monitor("%b%b:%b%b",a,b,c,d);
    #1 a=0; b=0; 
    #1 a=0; b=1;
    #1 a=1; b=0;
    #1 a=1; b=1;
    #10 $finish;
  end
endmodule
