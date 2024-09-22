//2 to 4 line decoder
module decoder(
  output Y0,Y1,Y2,Y3,
  input A0,A1,G
);  
  wire W1,W2,W3,W4,W5,
  W6,W7,W8,W9,W10;
  and G0 (W3,W2,W1);
  and G1 (W4,W2,A0);
  and G2 (W5,A1,W1);
  and G3 (W6,A1,A0);
  and G4 (W7,W3,G);
  and G5 (W8,W4,G);
  and G6 (W9,W5,G);
  and G7 (W10,W6,G);
  not G8 (W1,A0);
  not G9 (W2,A1);
  not G10 (Y0,W7);
  not G11 (Y1,W8);
  not G12 (Y2,W9);
  not G13 (Y3,W10);
endmodule
