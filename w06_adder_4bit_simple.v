module adder_4bit_simple(
    input  [3:0] a, b,
    output [3:0] sum,
    output carry
);
    assign {carry, sum} = a + b;   // one line replaces the whole ripple chain
endmodule
