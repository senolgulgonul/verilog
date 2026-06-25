module fulladder(
    output S, Co,
    input  A, B, Ci
);
    wire W1, W2, W3;
    xor G0 (W1, A, B);
    xor G1 (S,  W1, Ci);
    and G2 (W2, A, B);
    and G3 (W3, Ci, W1);
    or  G4 (Co, W2, W3);
endmodule

module fourbitadder(
    output S0, S1, S2, S3, C4,
    input  A0, A1, A2, A3, B0, B1, B2, B3, C0
);
    wire C1, C2, C3;
    fulladder M0(.S(S0), .Co(C1), .A(A0), .B(B0), .Ci(C0));
    fulladder M1(.S(S1), .Co(C2), .A(A1), .B(B1), .Ci(C1));
    fulladder M2(.S(S2), .Co(C3), .A(A2), .B(B2), .Ci(C2));
    fulladder M3(.S(S3), .Co(C4), .A(A3), .B(B3), .Ci(C3));
endmodule
