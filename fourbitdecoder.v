module decoder4to16 (
    input wire [3:0] in,     // 4-bit input
    output reg out0,         // 16 individual 1-bit outputs
    output reg out1,
    output reg out2,
    output reg out3,
    output reg out4,
    output reg out5,
    output reg out6,
    output reg out7,
    output reg out8,
    output reg out9,
    output reg out10,
    output reg out11,
    output reg out12,
    output reg out13,
    output reg out14,
    output reg out15
);
always @* begin
    // Initialize all outputs to 0
    out0 = 1'b0;
    out1 = 1'b0;
    out2 = 1'b0;
    out3 = 1'b0;
    out4 = 1'b0;
    out5 = 1'b0;
    out6 = 1'b0;
    out7 = 1'b0;
    out8 = 1'b0;
    out9 = 1'b0;
    out10 = 1'b0;
    out11 = 1'b0;
    out12 = 1'b0;
    out13 = 1'b0;
    out14 = 1'b0;
    out15 = 1'b0;
    // Set the corresponding output bit based on the input value
    case(in)
        4'd0: out0 = 1'b1;
        4'd1: out1 = 1'b1;
        4'd2: out2 = 1'b1;
        4'd3: out3 = 1'b1;
        4'd4: out4 = 1'b1;
        4'd5: out5 = 1'b1;
        4'd6: out6 = 1'b1;
        4'd7: out7 = 1'b1;
        4'd8: out8 = 1'b1;
        4'd9: out9 = 1'b1;
        4'd10: out10 = 1'b1;
        4'd11: out11 = 1'b1;
        4'd12: out12 = 1'b1;
        4'd13: out13 = 1'b1;
        4'd14: out14 = 1'b1;
        4'd15: out15 = 1'b1;
    endcase
end
endmodule