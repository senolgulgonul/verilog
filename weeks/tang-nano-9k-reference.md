# Tang Nano 9K — Pin & Constraints Reference

Quick reference for the FPGA weeks (7–10). Device: **GW1NR-9C**, part `GW1NR-UV9QN88PC6/I5`, package QFN88P, speed C6/I5 (match the silkscreen;
newer boards are `GW1NR-LV9QN88PC6/I5` or `-9C`). Clock: **27 MHz** crystal.

## On-board I/O

| Function | Pin | Polarity |
|---|---|---|
| Clock (27 MHz) | 52 | — |
| LED 0 | 10 | active-LOW (lit when pin = 0) |
| LED 1 | 11 | active-LOW |
| LED 2 | 13 | active-LOW |
| LED 3 | 14 | active-LOW |
| LED 4 | 15 | active-LOW |
| LED 5 | 16 | active-LOW |
| Button S1 | 4 | active-LOW (pressed = 0), default 1 |
| Button S2 | 3 | active-LOW (pressed = 0), default 1 |

> LEDs are common-anode from the supply rail, so a pin must be driven **low** to light its
> LED. Keep your logic positive and invert once at the pin: `assign leds = ~value;`.

## Reusable constraints (`.cst`)

Copy the lines you need. Gowin constraint syntax:

```
// --- clock ---
IO_LOC  "clk" 52;
IO_PORT "clk" PULL_MODE=UP;

// --- 6 LEDs as a vector leds[5:0] ---
IO_LOC  "leds[0]" 10; IO_PORT "leds[0]" PULL_MODE=UP DRIVE=8;
IO_LOC  "leds[1]" 11; IO_PORT "leds[1]" PULL_MODE=UP DRIVE=8;
IO_LOC  "leds[2]" 13; IO_PORT "leds[2]" PULL_MODE=UP DRIVE=8;
IO_LOC  "leds[3]" 14; IO_PORT "leds[3]" PULL_MODE=UP DRIVE=8;
IO_LOC  "leds[4]" 15; IO_PORT "leds[4]" PULL_MODE=UP DRIVE=8;
IO_LOC  "leds[5]" 16; IO_PORT "leds[5]" PULL_MODE=UP DRIVE=8;

// --- buttons ---
IO_LOC  "s1" 4; IO_PORT "s1" PULL_MODE=UP;
IO_LOC  "s2" 3; IO_PORT "s2" PULL_MODE=UP;

// --- a free header pin for UART TX (example) ---
IO_LOC  "tx" 17; IO_PORT "tx" PULL_MODE=UP DRIVE=8;
```

## The verify-then-build loop

1. Write `design.v` and verify it in [VeriSim](https://senolgulgonul.github.io/verisim/).
2. For dividers/counters, **scale the divisor down** in simulation so behaviour is visible,
   then restore the real value for hardware.
3. In Gowin: New Project → GW1NR-9C → add `design.v` + `.cst` → Synthesize → Place & Route →
   Program (SRAM for testing, Flash to persist).
4. Compare Gowin's **Schematic Viewer** with VeriSim's **RTL** view.

## Lecture example repos

- Course examples: <https://github.com/senolgulgonul/tangnano9k>
- Sipeed examples: <https://github.com/sipeed/TangNano-9K-example>
- Lushay Labs guide: <https://github.com/lushaylabs/tangnano9k>
