//half adder
module halfadder(
  output S,C,
  input A,B
);
  xor G0 (S,A,B);
  and G1 (C,A,B);
endmodule
