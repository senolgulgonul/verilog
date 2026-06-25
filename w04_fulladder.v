module halfadder(output S, C, input A, B);
    xor G0 (S, A, B);
    and G1 (C, A, B);
endmodule

module fulladder(output S, Co, input A, B, Ci);
    wire W1, C1, C2;
    halfadder H0(.S(W1), .C(C1), .A(A),  .B(B));    // module in module
    halfadder H1(.S(S),  .C(C2), .A(W1), .B(Ci));
    or G4 (Co, C1, C2);
endmodule
