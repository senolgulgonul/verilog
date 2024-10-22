`timescale 1ns / 1ns
`include "fourbitdecoder.v"
module tb_decoder4to16;
    reg [3:0] in; //inputs
    wire out0, out1, out2, out3, out4, out5, out6, out7, out8, out9;
    wire out10, out11, out12, out13, out14, out15;
    decoder4to16 M0 (
        .in(in),
        .out0(out0), .out1(out1), .out2(out2), .out3(out3), .out4(out4), .out5(out5),
        .out6(out6), .out7(out7), .out8(out8), .out9(out9), .out10(out10), .out11(out11),
        .out12(out12), .out13(out13), .out14(out14), .out15(out15)
    );
    initial begin
        $monitor("Time=%0t in=%d out=%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b", $time, in,
                 out15, out14, out13, out12, out11, out10, out9, out8, out7, out6, out5, out4, out3, out2, out1, out0);
        // Apply test inputs
        in = 4'd0; #10;
        in = 4'd1; #10;
        in = 4'd14; #10;
        in = 4'd15; #10;
        $finish;
    end
endmodule