# VeriSim "Open in VeriSim" links — EEE 303 courseware

All pairs validated with Icarus Verilog 12 under **Verilog-2005** (VeriSim default). Files go in the **root** of `github.com/senolgulgonul/verilog`. `tb source` = *page* (testbench shown on the week page) or *auto* (minimal sweep testbench generated for an example that had none — review these for teaching intent).

## Week 1 — Why Verilog / gate-level

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Run any of these in VeriSim | `w01_halfadder.v` | `w01_halfadder_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w01_halfadder.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w01_halfadder_tb.v) |
| Example 2 — Two AND gates: naming the wire bet | `w01_twoand.v` | `w01_twoand_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w01_twoand.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w01_twoand_tb.v) |
| Example 3 — Full adder (more gates, more wires | `w01_fulladder.v` | `w01_fulladder_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w01_fulladder.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w01_fulladder_tb.v) |
| Example 4 — 2-to-1 MUX from gates | `w01_mux2to1.v` | `w01_mux2to1_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w01_mux2to1.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w01_mux2to1_tb.v) |
| Example 5 — A datasheet circuit: gate-level 2- | `w01_decoder.v` | `w01_decoder_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w01_decoder.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w01_decoder_tb.v) |

## Week 2 — Testbenches

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Example 1 — Testbench for the half adder | `w02_halfadder.v` | `w02_halfadder_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w02_halfadder.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w02_halfadder_tb.v) |
| Example 2 — Testbench for the full adder | `w02_fulladder.v` | `w02_fulladder_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w02_fulladder.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w02_fulladder_tb.v) |
| Example 3 — Testbench for the 2-to-1 MUX | `w02_mux2to1.v` | `w02_mux2to1_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w02_mux2to1.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w02_mux2to1_tb.v) |

## Week 3 — Catching errors

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Example 1 — The "wrong full adder" (find the b | `w03_fulladder_buggy.v` | `w03_fulladder_buggy_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w03_fulladder_buggy.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w03_fulladder_buggy_tb.v) |
| Example 2 — Self-checking testbench | `w03_fulladder.v` | `w03_fulladder_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w03_fulladder.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w03_fulladder_tb.v) |
| Example 3 — Test-vector table | `w03_fulladder_v2.v` | `w03_fulladder_v2_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w03_fulladder_v2.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w03_fulladder_v2_tb.v) |

## Week 4 — Hierarchy

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Example 2 — 4-bit ripple-carry adder (his `fou | `w04_fourbitadder.v` | `w04_fourbitadder_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w04_fourbitadder.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w04_fourbitadder_tb.v) |
| Example 1 — Full adder from two half adders | `w04_fulladder.v` | `w04_fulladder_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w04_fulladder.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w04_fulladder_tb.v) |
| Example 3 — Hierarchy reuse: a 4-bit 2-to-1 MU | `w04_mux2to1_4bit.v` | `w04_mux2to1_4bit_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w04_mux2to1_4bit.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w04_mux2to1_4bit_tb.v) |

## Week 5 — Timing & glitches

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Example 1 — Full adder with gate delays | `w05_fulladder.v` | `w05_fulladder_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w05_fulladder.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w05_fulladder_tb.v) |
| Example 2 — A static hazard (glitch) | `w05_hazard.v` | `w05_hazard_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w05_hazard.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w05_hazard_tb.v) |
| Example 3 — Ripple-carry settling time | `w05_fourbitadder.v` | `w05_fourbitadder_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w05_fourbitadder.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w05_fourbitadder_tb.v) |

## Week 6 — Dataflow

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Example 1 — Half adder, three dataflow ways | `w06_halfadder_arith.v` | `w06_halfadder_arith_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w06_halfadder_arith.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w06_halfadder_arith_tb.v) |
| Example 2 — Operators on vectors (mini ALU sli | `w06_alu_ops.v` | `w06_alu_ops_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w06_alu_ops.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w06_alu_ops_tb.v) |
| Example 3 — 2-to-1 MUX with the conditional op | `w06_mux2to1.v` | `w06_mux2to1_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w06_mux2to1.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w06_mux2to1_tb.v) |
| Example 4 — 4-to-1 MUX with nested conditional | `w06_mux4to1.v` | `w06_mux4to1_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w06_mux4to1.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w06_mux4to1_tb.v) |
| Example 5 — 4-bit adder, dataflow (compare wit | `w06_adder_4bit_simple.v` | `w06_adder_4bit_simple_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w06_adder_4bit_simple.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w06_adder_4bit_simple_tb.v) |

## Week 7 — Behavioral

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Example 3 — 4-to-1 MUX with a vector select (p | `w07_mux4to1.v` | `w07_mux4to1_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w07_mux4to1.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w07_mux4to1_tb.v) |
| Example 1 — 2-to-1 MUX with if-else | `w07_mux_2to1_ifelse.v` | `w07_mux_2to1_ifelse_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w07_mux_2to1_ifelse.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w07_mux_2to1_ifelse_tb.v) |
| Example 2 — the same MUX with case | `w07_mux_2to1_case.v` | `w07_mux_2to1_case_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w07_mux_2to1_case.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w07_mux_2to1_case_tb.v) |
| Example 4 — case with number literals (exam st | `w07_digit_select.v` | `w07_digit_select_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w07_digit_select.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w07_digit_select_tb.v) |

## Week 8 — Sequential / DFF

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Example 1 — D flip-flop (his form) | `w08_dff.v` | `w08_dff_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w08_dff.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w08_dff_tb.v) |
| Example 2 — 1-bit register with write enable | `w08_reg1.v` | `w08_reg1_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w08_reg1.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w08_reg1_tb.v) |
| Example 3 — N-bit register and a shift registe | `w08_shift4.v` | `w08_shift4_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w08_shift4.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w08_shift4_tb.v) |

## Week 9 — Blocking vs non-blocking

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Example 1 — Non-blocking (his example): `a <=  | `w09_nonblocking_example.v` | `w09_nonblocking_example_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w09_nonblocking_example.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w09_nonblocking_example_tb.v) |
| Example 2 — Blocking: `a = b; c = a;` | `w09_blocking_example.v` | `w09_blocking_example_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w09_blocking_example.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w09_blocking_example_tb.v) |
| Example 3 — The register-swap test | `w09_swap_nb.v` | `w09_swap_nb_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w09_swap_nb.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w09_swap_nb_tb.v) |

## Week 10 — Synthesis

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Example 1 — See the full adder synthesized | `w10_dff.v` | `w10_dff_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w10_dff.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w10_dff_tb.v) |
| Example 4 — The latch trap (and the fix) | `w10_bad_mux.v` | `w10_bad_mux_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w10_bad_mux.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w10_bad_mux_tb.v) |

## Week 11 — FSM

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Example 1 — "BABA" detector (Mealy) — his exam | `w11_sequence_detector.v` | `w11_sequence_detector_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w11_sequence_detector.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w11_sequence_detector_tb.v) |
| Example 2 — Moore version of a detector (for c | `w11_moore1011.v` | `w11_moore1011_tb.v` | auto | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w11_moore1011.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w11_moore1011_tb.v) |

## Week 12 — FPGA board

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Example 1 — AND gate to an LED (his example) | `w12_and_demo.v` | `w12_and_demo_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w12_and_demo.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w12_and_demo_tb.v) |
| Example 2 — Half adder on the board | `w12_half_adder_board.v` | `w12_half_adder_board_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w12_half_adder_board.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w12_half_adder_board_tb.v) |
| Example 3 — if-else pattern selector | `w12_ifelse_demo.v` | `w12_ifelse_demo_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w12_ifelse_demo.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w12_ifelse_demo_tb.v) |

## Week 13 — On-board examples

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Example 1 — Behavioral case to a one-hot LED | `w13_case_demo.v` | `w13_case_demo_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w13_case_demo.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w13_case_demo_tb.v) |
| Example 2 — Using the clock: blink an LED | `w13_blink.v` | `w13_blink_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w13_blink.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w13_blink_tb.v) |
| Example 3 — Counter and walking LED | `w13_counter_leds.v` | `w13_counter_leds_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w13_counter_leds.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w13_counter_leds_tb.v) |
| Example 4 — Memory (ROM) on the board | `w13_rom_demo.v` | `w13_rom_demo_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w13_rom_demo.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w13_rom_demo_tb.v) |
| Example 5 — FSM on the board (his button3/butt | `w13_fsm_board.v` | `w13_fsm_board_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w13_fsm_board.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w13_fsm_board_tb.v) |
| Example 6 — UART transmitter (8N1) | `w13_uart_tx.v` | `w13_uart_tx_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w13_uart_tx.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w13_uart_tx_tb.v) |

## Week 14 — MCU / CPU

| Example | design.v | testbench.v | tb source | Open in VeriSim |
|---|---|---|---|---|
| Example 2 — the whole 4-bit MCU | `w14_mcu4.v` | `w14_mcu4_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w14_mcu4.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w14_mcu4_tb.v) |
| RISC-V | `w14_cpu.v` | `w14_cpu_tb.v` | page | [▶ open](https://senolgulgonul.github.io/verisim/?design=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w14_cpu.v&testbench=https://raw.githubusercontent.com/senolgulgonul/verilog/main/w14_cpu_tb.v) |
