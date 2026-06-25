`timescale 1ns/1ps
module nonblocking_example(
    input  wire clk,
    input  wire b,
    output reg  a,
    output reg  c
);
    initial begin a = 0; c = 0; end
    always @(posedge clk) begin
        a <= b;   // non-blocking
        c <= a;   // 'c' gets the OLD value of 'a' (before 'a' becomes 'b')
    end
endmodule
