# VeriSim example files + "Open in VeriSim" links — EEE 303

Generated for github.com/senolgulgonul/verilog. Every design+testbench pair was
compiled AND run with Icarus Verilog 12 under Verilog-2005 (VeriSim's default).

## What's here
- `root_files/`     94 files (47 design + 47 testbench). Copy ALL into the REPO ROOT
                    (next to halfadder.v etc). Names are unique: w<NN>_<name>.v / _tb.v.
- `weeks_patched/`  the 14 week .md pages with an "Open in VeriSim" line inserted
                    after each example. Drop them into weeks/ (they replace the originals).
- `verisim-links.md` reference table of every example, its two files, and its link.

## How the link works
https://senolgulgonul.github.io/verisim/?design=<raw url>&testbench=<raw url>
VeriSim auto-loads both panes; press Run. Links resolve only AFTER you commit the
files to the repo (raw.githubusercontent.com/.../main/<file>).

## Testbenches: page vs auto
- 28 testbenches are the author's, copied verbatim from the week pages.
- 19 are AUTO-GENERATED minimal sweeps for examples that showed a design but no
  testbench. They compile and run, but review them for teaching intent:
  w01 twoand/fulladder/mux2to1/decoder, w04 fulladder/mux2to1_4bit,
  w06 alu_ops/mux2to1/mux4to1/adder_4bit_simple, w07 mux_2to1_ifelse/mux_2to1_case/digit_select,
  w08 shift4, w09 blocking_example/swap_nb, w10 dff/bad_mux, w11 moore1011.

## Notes
- Existing root files (halfadder.v, fulladder.v, ...) are untouched; these are new w*_ files.
- Week 3 has both w03_fulladder_buggy.* (demonstrates the bug) and w03_fulladder.* (correct, self-checking).
