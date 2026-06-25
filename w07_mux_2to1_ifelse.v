module mux_2to1_ifelse(
    input  wire a,    // input 0
    input  wire b,    // input 1
    input  wire sel,  // select
    output reg  y
);
    always @* begin
        if (sel) y = b;
        else     y = a;
    end
endmodule
