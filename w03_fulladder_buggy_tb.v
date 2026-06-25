`timescale 1ns/1ns
module tb;
    reg [2:0] in; wire S, Co; integer i;
    fulladder M0(.S(S), .Co(Co), .A(in[2]), .B(in[1]), .Ci(in[0]));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        $display("A B Ci : Co S");
        for (i=0;i<8;i=i+1) begin in=i; #10;
            $display("%b %b  %b :  %b %b", in[2],in[1],in[0],Co,S); end
        $finish;
    end
endmodule
