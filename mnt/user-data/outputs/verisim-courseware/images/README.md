# Figures

All figures here are **original work generated for this course** (or the author's own
drawing), so they are safe to publish with the courseware (suggested CC BY 4.0).

## Schematics (original, generated to match the course code)
- `halfadder.svg` — half adder: G0 XOR -> S, G1 AND -> C
- `mux2to1.svg` — gate-level 2-to-1 MUX: G1/G2 AND, G3 NOT, G4 OR, wire W1
- `decoder.svg` — gate-level 2-to-4 decoder: 2 inverters, 4 enable-gated AND minterms,
  active-low outputs Y0..Y3
- `fourbitadder.svg` — 4-bit ripple-carry adder block diagram: M0..M3, carry chain C0..C4
- `fsm_baba_states.svg` — BABA detector state diagram (IDLE->B_->BA_->BAB_, A/Y=1 feedback)
- `synthesis_flow.svg` — Verilog RTL -> Yosys -> gate netlist -> FPGA bitstream (lecture stops at schematic)
- `tangnano_pinout.svg` — Tang Nano 9K pinout drawn from scratch (clk 52; S1=4, S2=3; LEDs 10/11/13/14/15/16, active-low)

## Author's own drawing
- `fulladder.png` — full adder drawn by S. Gulgonul in a logic editor (W1/W2/W3 labels)

## Waveforms (original, drawn from the verified simulation traces)
- `wave_halfadder.svg`   — A,B sweep; S=A^B, C=A&B
- `wave_fulladder.svg`   — all 8 input cases; Co,S
- `wave_mux4to1.svg`     — y follows the selected input as sel steps 00->11
- `wave_glitch.svg`      — static-1 hazard: Y dips while it should hold 1
- `wave_dff.svg`         — Q captures D on rising edges only
- `wave_nonblocking.svg` — pipeline: b -> a (1 clk) -> c (1 clk); c lags a
- `wave_baba.svg`        — BABA Mealy detector: Y=1 on the fifth input
- `wave_mcu.svg`         — fetch/decode/execute; acc 3->5->7->5; out=5, then halted


## Author's own screenshots and photo (Gowin EDA UI © Gowin)
- `tangnano9k_front.jpg` — author's photo, front of the board (USB-C, S1/S2 buttons, FPGA)
- `tangnano9k_back_pins.png` — author's photo, back of the board (pin-number silkscreen)
- `tangnano9k_photo.png` — author's photo of the board running with LEDs lit
- `gowin_01_newproject.png` ... `gowin_09_schematic_rtl.png` — author's own screenshots of the
  Gowin EDA flow on the `buffer` project (New Project, device GW1NR-9C summary, add Verilog,
  synthesize + config, CST prompt, I/O constraints, place & route, programmer, RTL schematic)
- `gowin_10_schematic_and.png` — Gowin Schematic Viewer on a gate-level AND primitive
These are the author's own captures/photo; the Gowin EDA interface shown is © Gowin.

## Not included (third-party — link to the source instead of redistributing)
The lecture slides also contain figures owned by others; these are intentionally **not**
in this repo:
- 2-to-4 decoder / 4-bit adder IC logic diagrams — manufacturer datasheets (TI etc.)
- half-adder / multiplexer textbook figures — Mano & Ciletti, *Digital Design*
- Tang Nano 9K board photos — Sipeed; Gowin IDE screenshots — Gowin EDA
For these, link to the official datasheet / vendor page, or use your own board photo.
