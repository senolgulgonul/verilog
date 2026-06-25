`timescale 1ns/1ps
module tb;
    reg data, enable, clk; wire Q;
    reg1 M0(.Q(Q), .data(data), .enable(enable), .clk(clk));
    initial begin clk = 0; forever #1 clk = ~clk; end
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        $monitor("t=%0t en=%b data=%b Q=%b", $time, enable, data, Q);
        enable=1; data=1; #2;     // write 1
        enable=0; data=0; #4;     // disabled: Q stays 1 though data changed
        enable=1;         #2;     // write again -> Q follows data (0)
        $finish;
    end
endmodule
