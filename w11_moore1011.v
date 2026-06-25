module moore1011(input clk, input rst, input din, output detected);
    localparam S0=3'd0,S1=3'd1,S2=3'd2,S3=3'd3,S4=3'd4;
    reg [2:0] state;
    always @(posedge clk or posedge rst)
        if (rst) state <= S0;
        else case (state)
            S0: state <= din ? S1 : S0;
            S1: state <= din ? S1 : S2;
            S2: state <= din ? S3 : S0;
            S3: state <= din ? S4 : S2;
            S4: state <= din ? S1 : S2;
        endcase
    assign detected = (state == S4);   // Moore: from state only
endmodule
