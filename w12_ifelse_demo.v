module ifelse_demo(input s1, output [5:0] leds);
    reg [5:0] pattern;
    always @(*) begin
        if (s1 == 1'b0) pattern = 6'b101010;   // S1 pressed
        else            pattern = 6'b010101;
    end
    assign leds = ~pattern;                     // invert once, at the pin boundary
endmodule
