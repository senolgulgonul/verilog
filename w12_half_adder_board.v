module half_adder_board(input s1, input s2, output [1:0] led);
    wire a = ~s1, b = ~s2;          // active-low buttons -> positive logic
    wire sum   = a ^ b;
    wire carry = a & b;
    assign led = ~{carry, sum};     // active-low LEDs
endmodule
