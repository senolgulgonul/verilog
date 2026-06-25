module mux4to1(
    input  wire [1:0] sel,    // 2-bit selection
    input  wire a, b, c, d,
    output reg  y
);
    always @* begin
        case (sel)
            2'b00: y = a;
            2'b01: y = b;
            2'b10: y = c;
            2'b11: y = d;
        endcase
    end
endmodule
