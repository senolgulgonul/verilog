module digit_select(input A, output reg [3:0] B);
    always @(*) begin
        case (A)
            1'b0:    B = 4'd5;     // e.g. last digit of an ID
            1'b1:    B = 4'd4;     // second-to-last digit
            default: B = 4'd0;
        endcase
    end
endmodule
