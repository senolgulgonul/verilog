`timescale 1ns/1ns
module tb;
    reg [1:0] sel; reg a,b,c,d; wire y;
    mux4to1 M0(.sel(sel), .a(a), .b(b), .c(c), .d(d), .y(y));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        $monitor("Time=%0t sel=%b a=%b b=%b c=%b d=%b y=%b", $time, sel,a,b,c,d,y);
        a=0; b=1; c=1; d=1;
        sel=2'b00; #10;
        sel=2'b01; #10;
        sel=2'b10; #10;
        sel=2'b11; #10;
        $finish;
    end
endmodule
