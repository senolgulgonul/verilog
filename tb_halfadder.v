//testbench
`timescale 1 ns / 1 ns
module tb_halfadder ();
  reg  a,b;  //reg for inputs
  wire s,c;    //wire for outputs
  //instantiation
  halfadder M0 (.S(s),.C(c),.A(a),.B(b));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    $display("ab:sc");
    $monitor("%b%b:%b%b",a,b,s,c);
    #1 a=0; b=0; 
    #1 a=0; b=1;
    #1 a=1; b=0;
    #1 a=1; b=1;
    #10 $finish;
  end // initial
endmodule
