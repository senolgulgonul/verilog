// D flip-flop without reset
module DFF(
    output reg Q,
    input  wire D,
    input  wire Clk
);
    always @(posedge Clk) begin
        Q <= D;
    end
endmodule
