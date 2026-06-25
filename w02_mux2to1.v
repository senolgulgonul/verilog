module mux2to1(
    output Y,
    input  A, B, S
);
    wire W1, W2, W3;
    not G3 (W1, S);       // W1 = ~S
    and G1 (W2, A, W1);   // W2 = A & ~S
    and G2 (W3, B, S);    // W3 = B & S
    or  G4 (Y, W2, W3);
endmodule
