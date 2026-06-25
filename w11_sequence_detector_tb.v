`timescale 1ns/1ns
module tb;
    reg clk=0, rst=1, A=0, B=0, C=0, D=0; wire Y;
    sequence_detector M0(.clk(clk),.rst(rst),.A(A),.B(B),.C(C),.D(D),.Y(Y));
    always #5 clk = ~clk;
    // Mealy: apply input, observe Y (combinational), THEN clock to register the transition
    task feed(input pa,pb,pc,pd);
        begin
            @(posedge clk);
            A=pa; B=pb; C=pc; D=pd;
            #1 $display("A=%b B=%b C=%b D=%b -> Y=%b", A,B,C,D, Y);
        end
    endtask
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        @(negedge clk) rst = 0;
        feed(1,0,0,0); // A  (ignored from IDLE)
        feed(0,1,0,0); // B
        feed(1,0,0,0); // A
        feed(0,1,0,0); // B
        feed(1,0,0,0); // A  -> BABA complete -> Y=1
        feed(0,0,1,0); // C
        feed(0,0,0,1); // D
        @(posedge clk) $finish;
    end
endmodule
