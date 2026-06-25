module reg1(
    output reg Q,
    input  wire data, enable, clk
);
    always @(posedge clk) begin
        if (enable) Q <= data;     // write only when enabled
    end
endmodule
