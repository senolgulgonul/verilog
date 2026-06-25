module uart_tx #(parameter DIV = 234)   // 27 MHz / 115200 baud
(input wire clk, input wire start, input wire [7:0] data, output reg tx, output reg busy);
    localparam IDLE=1'b0, SEND=1'b1;
    reg state = IDLE; reg [3:0] bitidx = 0; reg [15:0] cnt = 0; reg [9:0] shifter = 10'h3FF;
    initial begin tx = 1'b1; busy = 1'b0; end
    always @(posedge clk) begin
        case (state)
            IDLE: begin
                tx <= 1'b1; busy <= 1'b0;
                if (start) begin
                    shifter <= {1'b1, data, 1'b0};   // {stop, data, start}, sent LSB first
                    bitidx <= 0; cnt <= 0; busy <= 1'b1; state <= SEND;
                end
            end
            SEND: if (cnt == DIV-1) begin
                      cnt <= 0; tx <= shifter[bitidx];
                      if (bitidx == 9) state <= IDLE; else bitidx <= bitidx + 1'b1;
                  end else cnt <= cnt + 1'b1;
        endcase
    end
endmodule
