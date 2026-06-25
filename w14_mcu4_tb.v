`timescale 1ns/1ps
module tb;
    reg clk = 0, rst = 1; wire [3:0] out; wire halted;
    mcu4 M0(.clk(clk), .rst(rst), .out(out), .halted(halted));
    always #5 clk = ~clk;
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        @(negedge clk) rst = 0;
        wait (halted == 1);
        @(posedge clk);
        $display("Program finished. OUT = %0d (expected 5), halted = %b", out, halted);
        if (out == 4'd5) $display("MCU TEST PASSED"); else $display("MCU TEST FAILED");
        $finish;
    end
endmodule
