`timescale 1ns/1ns
module tb;
    reg  [2:0] in; wire S, Co;
    integer i, errors = 0;
    // each vector: {A, B, Ci, expected_Co, expected_S}
    reg [4:0] vec [0:3];
    fulladder M0(.S(S), .Co(Co), .A(in[2]), .B(in[1]), .Ci(in[0]));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        vec[0]=5'b000_00; vec[1]=5'b011_10; vec[2]=5'b101_10; vec[3]=5'b111_11;
        for (i=0;i<4;i=i+1) begin
            in = vec[i][4:2]; #10;
            if ({Co,S} !== vec[i][1:0]) begin
                $display("FAIL vector %0d", i); errors = errors + 1; end
        end
        if (errors==0) $display("VECTORS PASSED");
        else           $display("VECTORS FAILED: %0d", errors);
        $finish;
    end
endmodule
