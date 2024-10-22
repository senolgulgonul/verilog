module mux_2to1_case (
    input wire A,          // Input 0
    input wire B,          // Input 1
    input wire SEL,        // Select line
    output reg Y           // Output
);
    always @* begin
        case (SEL)
            1'b0: Y = A;   // sel is 0
            1'b1: Y = B;   // sel is 1
        endcase
    end
endmodule
