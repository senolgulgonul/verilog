// D flip-flop without reset
`timescale 1ns/1ps
module DFF(output reg Q, input D, CLK);
    always @(posedge CLK) Q <= D;     // synthesizes to ONE flip-flop
endmodule
