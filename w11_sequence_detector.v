module sequence_detector(
    input clk, input rst,
    input A, input B, input C, input D,
    output reg Y
);
    localparam IDLE=2'd0, B_=2'd1, BA_=2'd2, BAB_=2'd3;
    reg [1:0] state, next;

    // state register (clocked)
    always @(posedge clk or posedge rst)
        if (rst) state <= IDLE;
        else     state <= next;

    // next-state + Mealy output (combinational)
    always @(*) begin
        next = state;
        Y = 1'b0;
        case (state)
            IDLE: if (B) next = B_;                       // got B
            B_:   if (A) next = BA_; else if (B) next = B_; else next = IDLE;
            BA_:  if (B) next = BAB_; else next = IDLE;    // got B A B
            BAB_: if (A) begin Y = 1'b1; next = BA_; end   // B A B A  -> detect! (overlap)
                  else if (B) next = B_; else next = IDLE;
        endcase
    end
endmodule
