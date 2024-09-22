//full adder
module fulladder(
  output S,Co,
  input A,B,Ci
);  
  wire W1,W2,W3;

  xor G0 (W1,A,B);
  xor G1 (S,W1,Ci);
  and G2 (W2,A,B);
  and G3 (W3,Ci,W1);
  or  G4 (Co,W2,W3);
endmodule
