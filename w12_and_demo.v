module and_demo(input s1, input s2, output led);
    // buttons pressed = 0; LED lit = 0.
    // "light when BOTH pressed": both pressed = (~s1 & ~s2); lit means output 0 -> invert.
    assign led = ~(~s1 & ~s2);     // simplifies to (s1 | s2)
endmodule
