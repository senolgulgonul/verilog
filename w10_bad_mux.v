module bad_mux(input [1:0] sel, input a, b, c, d, output reg y);
    always @(*)
        case (sel)
            2'b00: y = a;
            2'b01: y = b;
            2'b10: y = c;
            // 2'b11 missing, no default -> y must "remember" -> LATCH
        endcase
endmodule
