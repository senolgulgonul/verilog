module mux2to1(output Y, input A, B, S);
    wire W1, W2, W3;
    not G3 (W1, S);
    and G1 (W2, A, W1);
    and G2 (W3, B, S);
    or  G4 (Y, W2, W3);
endmodule

module mux2to1_4bit(output [3:0] Y, input [3:0] A, B, input S);
    mux2to1 M0(.Y(Y[0]), .A(A[0]), .B(B[0]), .S(S));
    mux2to1 M1(.Y(Y[1]), .A(A[1]), .B(B[1]), .S(S));
    mux2to1 M2(.Y(Y[2]), .A(A[2]), .B(B[2]), .S(S));
    mux2to1 M3(.Y(Y[3]), .A(A[3]), .B(B[3]), .S(S));
endmodule
