// D = (A AND B) AND C
module twoand(
    output D,
    input  A, B, C
);
    wire W1;            // the node between the two AND gates
    and G0 (W1, A, B);  // W1 = A & B
    and G1 (D, W1, C);  // D  = W1 & C
endmodule
