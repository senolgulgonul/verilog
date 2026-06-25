module blink #(parameter WAIT = 2_700_000)   // scale down for simulation (e.g. WAIT=2)
(input clk, output reg led);
    reg [31:0] counter = 0;
    initial led = 0;
    always @(posedge clk) begin
        if (counter == WAIT) begin counter <= 0; led <= ~led; end
        else                       counter <= counter + 1;
    end
endmodule
