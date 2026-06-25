module alu_ops(
    output [3:0] sum, diff,
    output and_all, lt,
    input  [3:0] A, B
);
    assign sum     = A + B;     // arithmetic (wraps in 4 bits)
    assign diff    = A - B;
    assign and_all = &A;        // reduction AND of all bits of A
    assign lt      = (A < B);   // relational -> 1 bit
endmodule
