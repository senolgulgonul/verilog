# Week 6 — Dataflow Modeling

## The historical idea

Writing every gate by hand (Weeks 1–5) is tedious. **Dataflow** modeling describes a circuit
by its *expressions* — `assign Y = A & B;` — a direct, combinational description. The tool
builds the gates; you write the logic.

## Objectives

- Use continuous assignment `assign`.
- Apply **bitwise** (`& | ^ ~`), **arithmetic** (`+ - *`), **relational** (`< > ==`) operators.
- Use the **conditional (ternary)** operator `cond ? t : f`.
- (Extra) Define a custom gate with a **User-Defined Primitive (UDP)**.

## Concept (short)

`assign` continuously drives a `wire` from an expression; whenever a right-hand input changes,
the output updates. The conditional operator is the compact MUX.

## Example 1 — Half adder, three dataflow ways

**`design.v`**
```verilog
// (a) bitwise operators
module halfadder_bitwise(output C, S, input A, B);
    assign S = A ^ B;
    assign C = A & B;
endmodule

// (b) arithmetic operator: the 2-bit sum {C,S} = A + B
module halfadder_arith(output C, S, input A, B);
    assign {C, S} = A + B;
endmodule
```

**`testbench.v`** (for either)
```verilog
`timescale 1ns/1ns
module tb;
    reg A,B; wire C,S; integer i;
    halfadder_arith M0(.C(C), .S(S), .A(A), .B(B));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, tb);
        $display("AB:CS");
        for (i=0;i<4;i=i+1) begin {A,B}=i; #10; $display("%b%b:%b%b",A,B,C,S); end
        $finish;
    end
endmodule
```

**Expected Console**
```
AB:CS
00:00
01:01
10:01
11:10
```

## Example 2 — Operators on vectors (mini ALU slice)

**`design.v`**
```verilog
module alu_ops(
    output [3:0] sum, diff,
    output and_all, lt,
    input  [3:0] A, B
);
    assign sum     = A + B;     // arithmetic (wraps in 4 bits)
    assign diff    = A - B;
    assign and_all = &A;        // reduction AND of all bits of A
    assign lt      = (A < B);   // relational -> 1 bit
endmodule
```

Drive `A=3,B=5` then `A=15,B=1`; expect `sum=8,diff=14,and_all=0,lt=1` then
`sum=0,diff=14,and_all=1,lt=0` (4-bit wrap; `&A`=1 only when `A=15`).

## Example 3 — 2-to-1 MUX with the conditional operator

**`design.v`**
```verilog
module mux2to1(
    input  SEL,
    input  A, B,
    output Y
);
    assign Y = SEL ? B : A;
endmodule
```

## Example 4 — 4-to-1 MUX with nested conditionals

**`design.v`**
```verilog
module mux4to1(
    input  SEL0, SEL1,
    input  A, B, C, D,
    output Y
);
    assign Y = !SEL1 & !SEL0 ? A :
               !SEL1 &  SEL0 ? B :
                SEL1 & !SEL0 ? C :
                               D ;  // SEL1 & SEL0
endmodule
```

## Example 5 — 4-bit adder, dataflow (compare with Week 4's structural one)

**`design.v`**
```verilog
module adder_4bit_simple(
    input  [3:0] a, b,
    output [3:0] sum,
    output carry
);
    assign {carry, sum} = a + b;   // one line replaces the whole ripple chain
endmodule
```

## (Extra) Example 6 — User-Defined Primitive

When you have a truth table but no built-in gate fits, a UDP defines the gate directly:

```verilog
// 2-to-1 MUX as a UDP
primitive udp_mux2to1(output y, input sel, input a, input b);
    table
        // sel a b : y
            0  0 ? : 0;   // sel=0 -> y=a
            0  1 ? : 1;
            1  ? 0 : 0;   // sel=1 -> y=b
            1  ? 1 : 1;
    endtable
endprimitive
```

## Run it in VeriSim

1. Run example 1 (arithmetic half adder) → the `AB:CS` table above.
2. Run example 2; confirm the wrap-around arithmetic and the reduction/relational results.
3. Run examples 3–5; sweep selects/inputs and confirm against the gate-level versions from
   Week 1 — the *same function*, fewer lines.

## What to look for

- **`wire` for `assign` outputs** — contrast with behavioral `always` outputs (Week 7), which
  must be `reg`.
- Vector widths matter: `a - b` is 4 bits and **wraps**. To keep borrow/carry, widen the result
  (`{carry, sum} = a + b`).

## Exercises (session 2)

1. **Full adder, dataflow.** `assign S = A^B^Ci; assign Co = (A&B)|(B&Ci)|(A&Ci);` Self-check.
2. **Conditional, exam style.** One module: `B = 3'b111` if `A==0`, `B = 3'b101` if `A==1`,
   with a single conditional assignment.
3. **Reduction operators.** Show `^A` (parity) and `|A` (any-bit-set) for a 4-bit input.
4. **UDP test.** Write a testbench for `udp_mux2to1` and confirm it matches `assign Y=SEL?B:A;`.
