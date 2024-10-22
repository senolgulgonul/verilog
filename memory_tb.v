`timescale 1ns / 1ns
`include "memory.v"
module tb_memory;
 reg we; //inputs
reg [4:0] address;
reg [15:0] data_in;
wire [15:0] data_out;
memory M0 (
.we(we),
.address(address),
.data_in(data_in),
.data_out(data_out)
);
initial begin
$monitor("Time=%0t we=%b address=%d data_in=%b data_out=%b", $time, we, address, data_in, data_out);
// Write data to addresses 
we = 1'b1;
address = 5'd0; data_in = 16'b1110000100000010; #10;
address = 5'd1; data_in = 16'b1110001100010100; #10;
address = 5'd2; data_in = 16'b0001111100000001; #10;
address = 5'd3; data_in = 16'b1001000000000010; #10;
// Switch to read mode
we = 1'b0;
address = 5'd0; #10;
address = 5'd1; #10;
address = 5'd2; #10;
address = 5'd3; #10;
$finish;
end
endmodule
