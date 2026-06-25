`timescale 1ns/1ps
module blocking_example(
    input  wire clk,
    input  wire b,
    output reg  a,
    output reg  c
);
    initial begin a = 0; c = 0; end
    always @(posedge clk) begin
        a = b;   // blocking - immediate update
        c = a;   // 'c' gets the NEW value of 'a'
    end
endmodule
