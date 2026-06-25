`timescale 1ns/1ns
module tb;
    reg  [2:0] in; wire S, Co;
    integer i, errors = 0;
    reg [1:0] expect;                       // {Co, S}
    fulladder M0(.S(S), .Co(Co), .A(in[2]), .B(in[1]), .Ci(in[0]));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        for (i=0;i<8;i=i+1) begin
            in = i; #10;
            expect = in[2] + in[1] + in[0]; // reference model
            if ({Co,S} !== expect) begin
                $display("FAIL A=%b B=%b Ci=%b -> got {Co,S}=%b%b expected %b",
                          in[2],in[1],in[0],Co,S,expect);
                errors = errors + 1;
            end
        end
        if (errors==0) $display("ALL TESTS PASSED");
        else           $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
