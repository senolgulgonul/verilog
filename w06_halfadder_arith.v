// (a) bitwise operators
module halfadder_bitwise(output C, S, input A, B);
    assign S = A ^ B;
    assign C = A & B;
endmodule

// (b) arithmetic operator: the 2-bit sum {C,S} = A + B
module halfadder_arith(output C, S, input A, B);
    assign {C, S} = A + B;
endmodule
