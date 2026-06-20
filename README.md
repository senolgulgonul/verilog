# EEE 303 — Digital System Design (VeriSim Edition)

A **14-week** courseware for learning **Verilog HDL** with
[**VeriSim**](https://senolgulgonul.github.io/verisim/) (Icarus Verilog + Yosys in the
browser), then implementing on the **Tang Nano 9K** FPGA.

> **Şenol Gülgönül**, Assist. Prof. Dr.
> Electrical & Electronics Engineering · Digital System Design

**[▶ Open the live reader and tutor](tutor.html)** reads every week in the browser and answers questions about the lesson on screen, on each student's own Claude account.

The course follows the **historical path of Verilog**:

1. **Why Verilog exists** — to *test* manually designed circuits. So we begin by
   **describing a given circuit** (from its schematic/datasheet) with gate-level primitives.
2. **How do we test it?** — testbenches: instantiation, stimulus, `$display`/`$monitor`/`$dumpfile`.
3. Only **much later** do we ask: if we can describe and test a circuit, why not let the tool
   *design* it for us? — that is **synthesis**.
4. Finally we put designs on real hardware (**FPGA**) and build a tiny **CPU**.

No installation for the first eleven weeks — everything runs in the browser. The FPGA weeks
use the free Gowin IDE and a Tang Nano 9K board (one per student).

---

## Semester calendar (16 weeks)

| | |
|---|---|
| Weeks 1-7 | **Part A — Combinational circuits** (describe + test) |
| — | Study week + **Midterm exam** |
| Weeks 8-14 | **Parts B & C — Sequential, Synthesis, FSM, FPGA, MCU** |
| — | Study week + **Final exam** |

14 teaching weeks; combinational logic is fully covered before the midterm.

---

## The one rule that makes waveforms appear

VeriSim shows a waveform only if the **testbench** dumps one. Every testbench begins with:

```verilog
$dumpfile("dump.vcd");
$dumpvars(0, tb);   // tb = the testbench module name
```

No dump call -> empty Waveform tab (Console still works).

## House conventions (matched to the exams)

- **Named instantiation:** `circuit uut(.A(A), .B(B), .C(C));` — not positional.
- **Named gate instances** when transcribing a schematic: `not n1(not_A, A);` so each wire on
  the drawing has a name in the code.
- **Timescale:** `` `timescale 1ns/1ps `` (unit / precision). Precision is taught explicitly
  in Week 8. (Exams have used both `1ns/100ps` and `1ns/1ps` — read the stated precision.)

---

## 14-Week Plan

### Part A — Combinational: describe and test (Weeks 1-7)

| Week | Topic |
|---|---|
| [1](weeks/week01-why-gatelevel.md) | Why Verilog; **gate-level modeling** — primitives, transcribing a circuit diagram |
| [2](weeks/week02-testbench.md) | **Testbenches** — instantiation, stimulus, `$display`/`$monitor`/`$dumpfile`/`$finish` |
| [3](weeks/week03-catching-errors.md) | **Catching wrong designs** — manual truth-table check, self-checking TB, test vectors |
| [4](weeks/week04-hierarchy.md) | **Hierarchical modeling** — module-in-module, full adder, 4-bit adder |
| [5](weeks/week05-timing-glitches.md) | **Timing** — propagation delay, rise/fall, **glitches & hazards** |
| [6](weeks/week06-dataflow.md) | **Dataflow modeling** — `assign`, bitwise / arithmetic / conditional operators, UDP |
| [7](weeks/week07-behavioral.md) | **Behavioral (combinational)** — `always @*`, `if-else`, `case`, vectors, binary numbers |
| — | **MIDTERM** — combinational complete | — |

### Part B — Sequential, synthesis, FSM (Weeks 8-11)

| Week | Topic |
|---|---|
| [8](weeks/week08-sequential-dff.md) | **Sequential design** — D flip-flop, registers; **timescale & waveforms** matter now |
| [9](weeks/week09-blocking-nonblocking.md) | **Blocking vs non-blocking** assignment |
| [10](weeks/week10-synthesis.md) | **Synthesis** — describe -> design; the synthesized schematic; what is/ isn't synthesizable |
| [11](weeks/week11-fsm.md) | **Finite state machines** — Mealy/Moore, pattern detection |

### Part C — FPGA and a tiny CPU (Weeks 12-14)

| Week | Topic |
|---|---|
| [12](weeks/week12-fpga-board.md) | **FPGA & Tang Nano 9K** — three uses of Verilog, peripherals, the Gowin IDE flow |
| [13](weeks/week13-fpga-examples.md) | **On-board examples** — gate/dataflow/behavioral, memory, FSM, UART-TX; using an IP core (rPLL) |
| [14](weeks/week14-mcu.md) | **Microcontroller architecture** — a simple 4-bit MCU, fetch-decode-execute; brief RISC-V |
| — | **FINAL** | — |

### Reference

- [Tang Nano 9K pin & constraints reference](weeks/tang-nano-9k-reference.md)

---

## The three uses of Verilog (the spine of the course)

1. **Describe & simulate** a circuit you designed by hand (Weeks 1-9, 11).
2. **Synthesize** — let the tool build the circuit from your description (Week 10).
3. **FPGA implementation** — run it on real silicon (Weeks 12-14).

Every example is verified in VeriSim (Icarus 12 + Yosys) before it ever reaches the board.

## Runnable example code

The Verilog source and testbenches used in these weeks live at the **root of this repo**
(`halfadder.v`, `fulladder.v`, `twogates.v`, `two_to_four_decoder.v`, `mux21_case.v`,
`memory.v`, `rom.v`, and their `_tb.v` testbenches). They are tested with **Icarus Verilog**
and also run on **EDA Playground**. Several follow Morris Mano's *Digital Design* (the course
textbook), with typo corrections and added testbenches.

Paste any of them into [VeriSim](https://senolgulgonul.github.io/verisim/) to simulate in the
browser.

## Hardware & links

- VeriSim: <https://senolgulgonul.github.io/verisim/>
- Board: Sipeed **Tang Nano 9K** (Gowin **GW1NR-9C**, `GW1NR-UV9QN88PC6/I5`), 27 MHz clock on pin 52, free Gowin IDE
- Tang Nano 9K board examples (separate repo): <https://github.com/senolgulgonul/tangnano9k>

## License

Licensed under **CC BY 4.0** — reuse and adapt freely, including the figures, with attribution. See [LICENSE](LICENSE).
