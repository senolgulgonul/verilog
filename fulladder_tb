//testbench
`timescale 1 ns / 1 ns
module tb_fulladder;
  reg  a,b,ci;  //reg for inputs
  wire s,co;    //wire for outputs
  //instantiation
  fulladder M0 (.S(s),.Co(co),.A(a),.B(b),.Ci(ci));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    $display("abci:sco");
    $monitor("%b%b%b:%b%b",a,b,ci,s,co);
    #1 a=0; b=0; ci=0;
    #1 a=0; b=1; ci=0;
    #1 a=1; b=0; ci=0;
    #1 a=1; b=1; ci=0;
    #10 $finish;
  end // initial
endmodule
