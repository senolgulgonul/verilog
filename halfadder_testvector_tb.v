`timescale 1 ns / 1 ns
module halfadder_tb;
    // Inputs to the DUT (Device Under Test)
    reg A,B;   
    // Outputs from the DUT
    wire C,S; // Carry, Sum
    // Instantiate the DUT
  halfadder dut ( .C(C), .S(S), .A(A), .B(B) );
    // Test vector storage
    reg [3:0] test_vectors [0:3]; // 4 bits wide, 4 test cases
    integer i;
    initial begin
        // Read test vectors from file
        $readmemb("testvectors.txt", test_vectors);
        
        // Apply test vectors
        for (i = 0; i < 4; i = i + 1) begin
            // Assign inputs from the test vectors
            {A, B} = test_vectors[i][3:2];
            // Wait for the output to stabilize
            #10;
            // Check the results
  if (C !== test_vectors[i][1] || S !== test_vectors[i][0]) begin
   $display("Test failed for vector %0d: A=%b, B=%b, Expected_C=%b, Expected_S=%b, Got_C=%b, Got_S=%b",
   i, A, B, test_vectors[i][1], test_vectors[i][0], C, S);
end else begin
   $display("Test passed for vector %0d: A=%b, B=%b, C=%b, S=%b",
   i, A, B, C, S);
end //if else
end  //for
  $finish;
end //initial
endmodule
