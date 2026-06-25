# Week 3 — Catching Wrong Designs

## The historical idea

A testbench is only useful if it **catches mistakes**. We move from "watch the output" to
"let the testbench *judge* it." Three levels: (1) check by eye against the truth table,
(2) **self-checking** testbenches that compare to expected values, (3) **test-vector** tables
that drive many cases automatically.

## Objectives

- Compare simulated outputs to a hand-computed truth table.
- Diagnose a deliberately **wrong design** from the testbench output.
- Write a **self-checking** testbench that prints PASS/FAIL and counts errors.
- Use `===` / `!==` (not `==` / `!=`) so unknown (`x`) and high-Z (`z`) are caught.
- Drive a DUT from a **test-vector** table.

## Example 1 — The "wrong full adder" (find the bug)

This is the slide's wrong design: gate `G3` uses `W2` where it should use `W1`.

**`design.v`** (buggy on purpose)
```verilog
// full adder - WRONG DESIGN
module fulladder(
    output S, Co,
    input  A, B, Ci
);
    wire W1, W2, W3;
    xor G0 (W1, A, B);
    xor G1 (S,  W1, Ci);
    and G2 (W2, A, B);
    and G3 (W3, Ci, W2);   // BUG: should be (W3, Ci, W1)
    or  G4 (Co, W2, W3);
endmodule
```

Test it against the truth table and watch specific rows fail. Then fix `G3` to use `W1`.

**`testbench.v`** (truth-table print)
```verilog
`timescale 1ns/1ns
module tb;
    reg [2:0] in; wire S, Co; integer i;
    fulladder M0(.S(S), .Co(Co), .A(in[2]), .B(in[1]), .Ci(in[0]));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        $display("A B Ci : Co S");
        for (i=0;i<8;i=i+1) begin in=i; #10;
            $display("%b %b  %b :  %b %b", in[2],in[1],in[0],Co,S); end
        $finish;
    end
endmodule
```

> ▶ <strong><a href="https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w03_fulladder_buggy.v&amp;testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w03_fulladder_buggy_tb.v" target="_blank" rel="noopener">Open in VeriSim</a></strong> — loads `w03_fulladder_buggy.v` + `w03_fulladder_buggy_tb.v` and runs (Verilog-2005).

Compare the printed `Co` column with the correct one (Week 2, example 2). The wrong design
![Full adder waveform: correct Co/S over all 8 cases (compare your DUT against this)](../images/wave_fulladder.png)

miscomputes the carry for the cases where `Ci=1` and `A,B` differ.

## Example 2 — Self-checking testbench

Let the testbench compare against a reference and report failures automatically.

**`design.v`** — the *correct* `fulladder` (G3 uses W1).

**`testbench.v`**
```verilog
`timescale 1ns/1ns
module tb;
    reg  [2:0] in; wire S, Co;
    integer i, errors = 0;
    reg [1:0] expect;                       // {Co, S}
    fulladder M0(.S(S), .Co(Co), .A(in[2]), .B(in[1]), .Ci(in[0]));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        for (i=0;i<8;i=i+1) begin
            in = i; #10;
            expect = in[2] + in[1] + in[0]; // reference model
            if ({Co,S} !== expect) begin
                $display("FAIL A=%b B=%b Ci=%b -> got {Co,S}=%b%b expected %b",
                          in[2],in[1],in[0],Co,S,expect);
                errors = errors + 1;
            end
        end
        if (errors==0) $display("ALL TESTS PASSED");
        else           $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
```

> ▶ <strong><a href="https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w03_fulladder.v&amp;testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w03_fulladder_tb.v" target="_blank" rel="noopener">Open in VeriSim</a></strong> — loads `w03_fulladder.v` + `w03_fulladder_tb.v` and runs (Verilog-2005).

**Expected Console:** `ALL TESTS PASSED`. Put the **buggy** design back and the same testbench
prints `FAIL` lines and a non-zero count — proof the test works.

> **Use `!==`, not `!=`.** `!=` returns unknown if an operand is `x`, so an undriven output can
> slip through; `!==` compares `x`/`z` concretely and reports it.

## Example 3 — Test-vector table

Store inputs **and** expected outputs together; loop over them.

**`testbench.v`**
```verilog
`timescale 1ns/1ns
module tb;
    reg  [2:0] in; wire S, Co;
    integer i, errors = 0;
    // each vector: {A, B, Ci, expected_Co, expected_S}
    reg [4:0] vec [0:3];
    fulladder M0(.S(S), .Co(Co), .A(in[2]), .B(in[1]), .Ci(in[0]));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        vec[0]=5'b000_00; vec[1]=5'b011_10; vec[2]=5'b101_10; vec[3]=5'b111_11;
        for (i=0;i<4;i=i+1) begin
            in = vec[i][4:2]; #10;
            if ({Co,S} !== vec[i][1:0]) begin
                $display("FAIL vector %0d", i); errors = errors + 1; end
        end
        if (errors==0) $display("VECTORS PASSED");
        else           $display("VECTORS FAILED: %0d", errors);
        $finish;
    end
endmodule
```

> ▶ <strong><a href="https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w03_fulladder_v2.v&amp;testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w03_fulladder_v2_tb.v" target="_blank" rel="noopener">Open in VeriSim</a></strong> — loads `w03_fulladder_v2.v` + `w03_fulladder_v2_tb.v` and runs (Verilog-2005).

## Run it in VeriSim — then break it on purpose

1. Run example 2 → **ALL TESTS PASSED**.
2. Swap the correct design for the buggy one → specific **FAIL** lines + a count.
3. Line up a failing time on the **Waveform** with its FAIL message using the cursor.

## What to look for

- A good testbench **fails loudly** when the design is wrong. If breaking the design produces
  no failure, the testbench is not checking the right thing.
- The wrong full adder fails only on certain rows; predicting *which* rows from the bug is the
  real skill.

## Exercises (session 2)

1. **Wrong half adder.** Swap `and`/`or` on the carry gate; predict which `ab:cs` rows fail
   *before* running, then confirm with a self-checking testbench.
2. **Decoder check.** Write a self-checking testbench for the 2-to-4 decoder (exactly one
   output low when enabled; all high when disabled).
3. **x-detection.** Leave one output net undriven and show an `!==` check flags `x` while an
   `!=` check does not.
4. **Vector file.** Add two vectors with intentionally wrong expected values; confirm the
   testbench flags exactly those.
