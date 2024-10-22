`timescale 1ns / 1ns
`include "rom.v"
module tb_rom;
    reg [3:0] pcounter;
    wire [15:0] data_out;
    rom M0 (
        .address(pcounter),
        .data_out(data_out)
    );
    initial begin
        $monitor("Time=%0t pcounter=%d data_out=%b", $time, pcounter, data_out);
        // Read and print data from the first 5 addresses using pcounter
        pcounter = 4'd0; #10;
        pcounter = 4'd1; #10;
        pcounter = 4'd2; #10;
        pcounter = 4'd3; #10;
        pcounter = 4'd4; #10;
        $finish;
    end
endmodule
