`timescale 1ns/1ps
module tb;
    reg clk = 0, rst = 1;
    wire [31:0] pc, dmem0;
    cpu M0(.clk(clk), .rst(rst), .pc(pc), .dmem0(dmem0));
    always #5 clk = ~clk;
    integer cyc;
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        rst = 1; #12 rst = 0;                       // hold reset across first edge
        for (cyc=0; cyc<60; cyc=cyc+1) @(posedge clk);  // run the program
        $display("Program finished. dmem[0] = %0d (expected 55)", dmem0);
        if (dmem0 === 32'd55) $display("RISC-V TEST PASSED");
        else                  $display("RISC-V TEST FAILED");
        $finish;
    end
endmodule
