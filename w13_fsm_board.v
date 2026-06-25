module fsm_board(input clk, input button3, input button4, output reg [5:0] led);
    localparam IDLE=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;
    reg [2:0] state = IDLE;
    always @(posedge clk) begin
        if (~button4) state <= IDLE;             // button4 pressed -> reset
        else case (state)
            IDLE: begin led <= 6'b111111; if (~button3) state <= S1; end // press
            S1:   begin led <= 6'b111110; if ( button3) state <= S2; end // release
            S2:   begin led <= 6'b111101; if (~button3) state <= S3; end // press
            S3:   begin led <= 6'b111011; if ( button3) state <= S4; end // release
            S4:   begin led <= 6'b110111; end                            // caught!
            default: state <= IDLE;
        endcase
    end
endmodule
