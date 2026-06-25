`timescale 1ns/1ns
module fulladder(output S, Co, input A, B, Ci);
    wire W1, W2, W3;
    xor #(2) G0 (W1, A, B);
    xor #(2) G1 (S,  W1, Ci);
    and #(1) G2 (W2, A, B);
    and #(1) G3 (W3, Ci, W1);
    or  #(1) G4 (Co, W2, W3);
endmodule
