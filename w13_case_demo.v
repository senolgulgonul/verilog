module case_demo(input s1, input s2, output [5:0] leds);
    wire [1:0] sel = {~s1, ~s2};     // active-low buttons -> positive sel
    reg  [5:0] pattern;
    always @(*)
        case (sel)
            2'b00: pattern = 6'b000001;
            2'b01: pattern = 6'b000010;
            2'b10: pattern = 6'b000100;
            2'b11: pattern = 6'b001000;
            default: pattern = 6'b000000;
        endcase
    assign leds = ~pattern;
endmodule
