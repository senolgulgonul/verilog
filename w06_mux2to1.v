module mux2to1(
    input  SEL,
    input  A, B,
    output Y
);
    assign Y = SEL ? B : A;
endmodule
