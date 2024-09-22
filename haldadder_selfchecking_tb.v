//testbench
`timescale 1 ns / 1 ns
module tb_halfadder ();
  reg  a,b,test;  //reg for inputs
  wire s,c;    //wire for outputs
  //instantiation
  halfadder M0 (.S(s),.C(c),.A(a),.B(b));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    $display("self checking testbench:");
    $display("ab:cs:test");
    
    a=0; b=0; #1 test=(c==0)&&(s==0); 
    $display("%b%b:%b%b:%b",a,b,c,s,test);

    a=0; b=1; #1 test=(c==0)&&(s==1); 
    $display("%b%b:%b%b:%b",a,b,c,s,test);

    a=1; b=0; #1 test=(c==0)&&(s==1);
    $display("%b%b:%b%b:%b",a,b,c,s,test);

    a=1; b=1; #1 test=(c==1)&&(s==0);
    $display("%b%b:%b%b:%b",a,b,c,s,test);
    
    #10 $finish;
  end // initial
endmodule
