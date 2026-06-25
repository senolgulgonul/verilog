module rom_demo(input clk, input [2:0] addr, output reg [5:0] leds);
    reg [5:0] mem [0:7];
    initial begin                     // power-up content on the FPGA
        mem[0]=6'b000001; mem[1]=6'b000010; mem[2]=6'b000100; mem[3]=6'b001000;
        mem[4]=6'b010000; mem[5]=6'b100000; mem[6]=6'b101010; mem[7]=6'b010101;
    end
    always @(posedge clk) leds <= ~mem[addr];
endmodule
