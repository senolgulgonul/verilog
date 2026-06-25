module mux4to1(
    input  SEL0, SEL1,
    input  A, B, C, D,
    output Y
);
    assign Y = !SEL1 & !SEL0 ? A :
               !SEL1 &  SEL0 ? B :
                SEL1 & !SEL0 ? C :
                               D ;  // SEL1 & SEL0
endmodule
