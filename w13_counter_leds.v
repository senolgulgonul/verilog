module counter_leds #(parameter TICK = 2_700_000)(input clk, output [5:0] leds);
    reg [31:0] div = 0; reg [5:0] count = 0;
    always @(posedge clk)
        if (div == TICK) begin div <= 0; count <= count + 1'b1; end
        else div <= div + 1;
    assign leds = ~count;             // active-low count display
endmodule

module shift_leds #(parameter TICK = 5_000_000)(input clk, output [5:0] leds);
    reg [31:0] div = 0; reg [5:0] walk = 6'b000001;
    always @(posedge clk)
        if (div == TICK) begin div <= 0; walk <= {walk[4:0], walk[5]}; end
        else div <= div + 1;
    assign leds = ~walk;              // a lit LED walks across
endmodule
