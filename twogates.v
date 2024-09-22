//two gates
module twogates(
  output C,D,
  input A,B
);
  
nand G0 (C,B,A);  
nor G1 (D,B,A);
  
endmodule
