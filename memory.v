module memory (
    input wire we,             // Write enable
    input wire [4:0] address,  // Address input (5-bit)
    input wire [15:0] data_in,  // Data input (16-bit)
    output reg [15:0] data_out  // Data output (16-bit)
);
    // Memory array (32 address of 16-bit data)
    reg [15:0] mem [31:0];
    always @* begin
        if (we) begin
            // Write operation
            mem[address] = data_in;
            data_out = 16'bz;  // high-impedance
        end else begin
            // Read operation
            data_out = mem[address];
        end
    end
endmodule