module rom (
    input wire [3:0] address,  // 4-bit address input
    output reg [15:0] data_out // 16-bit data output
);
    reg [15:0] mem [0:15];
    initial begin
        mem[0] = 16'b1110000100000010;
        mem[1] = 16'b1110001100010100;
        mem[2] = 16'b0001111100000001;
        mem[3] = 16'b1001000000000010;
        mem[4] = 16'b0;
        mem[5] = 16'b0;
        mem[6] = 16'b0;
        mem[7] = 16'b0;
        mem[8] = 16'b0;
        mem[9] = 16'b0;
        mem[10] = 16'b0;
        mem[11] = 16'b0;
        mem[12] = 16'b0;
        mem[13] = 16'b0;
        mem[14] = 16'b0;
        mem[15] = 16'b0;
    end
    always @* begin
        data_out = mem[address];
    end
endmodule
