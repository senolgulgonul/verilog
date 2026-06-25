module mux_2to1_case(
    input  wire a, b, sel,
    output reg  y
);
    always @* begin
        case (sel)
            1'b0:    y = a;
            1'b1:    y = b;
            default: y = a;
        endcase
    end
endmodule
