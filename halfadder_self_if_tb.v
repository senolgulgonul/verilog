//testbench
`timescale 1 ns / 1 ns
module tb_halfadder();
  reg  a,b,test;  //reg for inputs
  wire s,c;    //wire for outputs
  //instantiation
  halfadder M0 (.S(s),.C(c),.A(a),.B(b));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    $display("self checking testbench:");
    $display("ab:cs:test");
    
    a=0; b=0; #10 
    if ((c==0)&&(s==0) !==1) $display("ab=00 failed");

    a=0; b=1; #10 
    if ((c==0)&&(s==1) !==1) $display("ab=01 failed");

    a=1; b=0; #10 
    if ((c==0)&&(s==1) !==1) $display("ab=10 failed");

    a=1; b=1; #10 
    if ((c==1)&&(s==1) !=1) $display("ab=11 failed");
    
    #20 $finish;
  end // initial
endmodule
