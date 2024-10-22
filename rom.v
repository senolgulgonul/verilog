module rom (
    input wire [3:0] address,  // 4-bit address input
    output reg [15:0] data_out // 16-bit data output
);
    // Memory array (16 locations of 16-bit data)
    reg [15:0] mem [0:15];
    // Initialize memory from file
    initial begin
        $readmemb("program.txt", mem);
    end
    always @* begin
        data_out = mem[address];
    end
endmodule
