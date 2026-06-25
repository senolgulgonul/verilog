module swap_nb(input clk, input [3:0] init_x, init_y, input load,
               output reg [3:0] x, y);
    always @(posedge clk) begin
        if (load) begin x <= init_x; y <= init_y; end
        else      begin x <= y;      y <= x;      end   // non-blocking: real swap
    end
endmodule
// Replace <= with = and x,y both become the same value (no swap).
