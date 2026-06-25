`timescale 1ns/1ns
module hazard(output Y, input A, B, C);
    wire W1, W2, W3;
    not #(2) G0 (W1, A);      // ~A is delayed
    and #(2) G1 (W2, A, B);
    and #(2) G2 (W3, W1, C);
    or  #(2) G3 (Y, W2, W3);
endmodule
