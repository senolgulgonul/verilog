module register #(parameter N = 4)
(input clk, input rst, input load, input [N-1:0] D, output reg [N-1:0] Q);
    always @(posedge clk) begin
        if (rst)       Q <= {N{1'b0}};
        else if (load) Q <= D;
    end
endmodule

module shift4(input clk, input rst, input din, output reg [3:0] Q);
    always @(posedge clk) begin
        if (rst) Q <= 4'b0;
        else     Q <= {Q[2:0], din};   // shift left; din enters at LSB
    end
endmodule
