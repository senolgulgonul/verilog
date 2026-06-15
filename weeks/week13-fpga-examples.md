# Week 13 — On-Board Examples: From Gate Level to UART, and Using an IP Core

## The historical idea

Everything you simulated now runs on silicon, in the order you learned it: gate/dataflow/
behavioral, **memory**, **FSM**, and a real peripheral — **UART transmit**. Finally, vendor
**IP cores** (like `rPLL`) are pre-made blocks you instantiate instead of hand-building.

## Objectives

- Map combinational and clocked designs to LEDs/buttons.
- Use the **27 MHz** clock with a divider for visible behaviour.
- Implement on-board **memory (ROM)** and an **FSM**.
- Build a **UART transmitter** and decode it.
- Instantiate a Gowin **IP core** (`rPLL`).

## Example 1 — Behavioral case to a one-hot LED

**`design.v`**
```verilog
module case_demo(input s1, input s2, output [5:0] leds);
    wire [1:0] sel = {~s1, ~s2};     // active-low buttons -> positive sel
    reg  [5:0] pattern;
    always @(*)
        case (sel)
            2'b00: pattern = 6'b000001;
            2'b01: pattern = 6'b000010;
            2'b10: pattern = 6'b000100;
            2'b11: pattern = 6'b001000;
            default: pattern = 6'b000000;
        endcase
    assign leds = ~pattern;
endmodule
```

**`testbench.v`**
```verilog
`timescale 1ns/1ns
module tb;
  reg s1, s2;
  wire [5:0] leds;
  case_demo dut(.s1(s1), .s2(s2), .leds(leds));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    s1=1; s2=1; #1 $display("sel=00 leds=%b", leds);
    s1=1; s2=0; #1 $display("sel=01 leds=%b", leds);
    s1=0; s2=1; #1 $display("sel=10 leds=%b", leds);
    s1=0; s2=0; #1 $display("sel=11 leds=%b", leds);
    $finish;
  end
endmodule
```

Expected (Icarus): `111110, 111101, 111011, 110111` — one LED lit per combination.

## Example 2 — Using the clock: blink an LED

**`design.v`**
```verilog
module blink #(parameter WAIT = 2_700_000)   // scale down for simulation (e.g. WAIT=2)
(input clk, output reg led);
    reg [31:0] counter = 0;
    initial led = 0;
    always @(posedge clk) begin
        if (counter == WAIT) begin counter <= 0; led <= ~led; end
        else                       counter <= counter + 1;
    end
endmodule
```

**`testbench.v`**
```verilog
`timescale 1ns/1ns
module tb;
  reg clk = 0;
  wire led;
  blink #(.WAIT(2)) dut(.clk(clk), .led(led));   // WAIT=2 to simulate; board uses 2_700_000
  always #5 clk = ~clk;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    repeat (12) begin @(posedge clk); #1 $display("t=%0t led=%b", $time, led); end
    $finish;
  end
endmodule
```

Expected (Icarus): with `WAIT=2`, `led` toggles every 3 clocks. The parameter keeps the logic identical and just shortens the wait for simulation.

> **Simulate by scaling.** 2.7 M cycles is impractical to simulate. In VeriSim set `WAIT = 3`
> to *see* the toggle on the waveform, then restore the real value for the board. Same logic,
> scaled clock — make students do exactly this.

## Example 3 — Counter and walking LED

**`design.v`**
```verilog
module counter_leds #(parameter TICK = 2_700_000)(input clk, output [5:0] leds);
    reg [31:0] div = 0; reg [5:0] count = 0;
    always @(posedge clk)
        if (div == TICK) begin div <= 0; count <= count + 1'b1; end
        else div <= div + 1;
    assign leds = ~count;             // active-low count display
endmodule

module shift_leds #(parameter TICK = 5_000_000)(input clk, output [5:0] leds);
    reg [31:0] div = 0; reg [5:0] walk = 6'b000001;
    always @(posedge clk)
        if (div == TICK) begin div <= 0; walk <= {walk[4:0], walk[5]}; end
        else div <= div + 1;
    assign leds = ~walk;              // a lit LED walks across
endmodule
```

**`testbench.v`**
```verilog
`timescale 1ns/1ns
module tb;
  reg clk = 0;
  wire [5:0] count_leds, walk_leds;
  counter_leds #(.TICK(1)) C(.clk(clk), .leds(count_leds));   // tiny TICK for simulation
  shift_leds   #(.TICK(1)) S(.clk(clk), .leds(walk_leds));
  always #5 clk = ~clk;
  integer i;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    for (i=0;i<8;i=i+1) begin @(posedge clk); #1
      $display("t=%0t count=%b walk=%b", $time, ~count_leds, ~walk_leds); end
    $finish;
  end
endmodule
```

Expected (Icarus): `count` increments and the lit bit in `walk` shifts left. Both modules live in this one `design.v`, so the testbench can drive both.

## Example 4 — Memory (ROM) on the board

**`design.v`**
```verilog
module rom_demo(input clk, input [2:0] addr, output reg [5:0] leds);
    reg [5:0] mem [0:7];
    initial begin                     // power-up content on the FPGA
        mem[0]=6'b000001; mem[1]=6'b000010; mem[2]=6'b000100; mem[3]=6'b001000;
        mem[4]=6'b010000; mem[5]=6'b100000; mem[6]=6'b101010; mem[7]=6'b010101;
    end
    always @(posedge clk) leds <= ~mem[addr];
endmodule
```

**`testbench.v`**
```verilog
`timescale 1ns/1ns
module tb;
  reg clk = 0;
  reg [2:0] addr;
  wire [5:0] leds;
  rom_demo dut(.clk(clk), .addr(addr), .leds(leds));
  always #5 clk = ~clk;
  integer i;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    for (i=0;i<8;i=i+1) begin addr=i; @(posedge clk); #1 $display("addr=%0d leds=%b", addr, leds); end
    $finish;
  end
endmodule
```

Expected (Icarus): `leds = ~mem[addr]` for each address, one clock after `addr` changes.

## Example 5 — FSM on the board (his button3/button4 example)

A clocked detector: press/release `S2` (button3) in the pattern, then `S1` (button4) resets.
The LEDs show the state.

**`design.v`**
```verilog
module fsm_board(input clk, input button3, input button4, output reg [5:0] led);
    localparam IDLE=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;
    reg [2:0] state = IDLE;
    always @(posedge clk) begin
        if (~button4) state <= IDLE;             // button4 pressed -> reset
        else case (state)
            IDLE: begin led <= 6'b111111; if (~button3) state <= S1; end // press
            S1:   begin led <= 6'b111110; if ( button3) state <= S2; end // release
            S2:   begin led <= 6'b111101; if (~button3) state <= S3; end // press
            S3:   begin led <= 6'b111011; if ( button3) state <= S4; end // release
            S4:   begin led <= 6'b110111; end                            // caught!
            default: state <= IDLE;
        endcase
    end
endmodule
```

**`testbench.v`**
```verilog
`timescale 1ns/1ns
module tb;
  reg clk = 0;
  reg button3 = 1, button4 = 1;   // 1 = not pressed (active-low)
  wire [5:0] led;
  fsm_board dut(.clk(clk), .button3(button3), .button4(button4), .led(led));
  always #5 clk = ~clk;
  task press(input v); begin button3 = v; @(posedge clk); #1
    $display("button3=%b led=%b", button3, led); end endtask
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    @(posedge clk); #1 $display("init     led=%b", led);
    press(0); press(1); press(0); press(1); press(1);   // press,release,press,release
    $finish;
  end
endmodule
```

Expected (Icarus): the LEDs walk `111111 -> 111110 -> 111101 -> 111011 -> 110111` as the press/release pattern is matched.

(`~button3` means "pressed". Add a clock divider so presses register cleanly; debouncing is an
exercise.)

## Example 6 — UART transmitter (8N1)

Verified in Icarus: sending `0x41` ('A') gives start=0, then `0x41` LSB-first, then stop=1.

**`design.v`**
```verilog
module uart_tx #(parameter DIV = 234)   // 27 MHz / 115200 baud
(input wire clk, input wire start, input wire [7:0] data, output reg tx, output reg busy);
    localparam IDLE=1'b0, SEND=1'b1;
    reg state = IDLE; reg [3:0] bitidx = 0; reg [15:0] cnt = 0; reg [9:0] shifter = 10'h3FF;
    initial begin tx = 1'b1; busy = 1'b0; end
    always @(posedge clk) begin
        case (state)
            IDLE: begin
                tx <= 1'b1; busy <= 1'b0;
                if (start) begin
                    shifter <= {1'b1, data, 1'b0};   // {stop, data, start}, sent LSB first
                    bitidx <= 0; cnt <= 0; busy <= 1'b1; state <= SEND;
                end
            end
            SEND: if (cnt == DIV-1) begin
                      cnt <= 0; tx <= shifter[bitidx];
                      if (bitidx == 9) state <= IDLE; else bitidx <= bitidx + 1'b1;
                  end else cnt <= cnt + 1'b1;
        endcase
    end
endmodule
```

> The framing concatenation `{1'b1, data, 1'b0}` is start bit, 8 data bits, stop bit. Simulate
> with a tiny `DIV` so the whole frame fits one waveform; use `DIV=234` on the board for 115200
> baud and decode the `tx` pin with a logic analyzer.

**`testbench.v`**
```verilog
`timescale 1ns/1ns
module tb;
  reg clk = 0;
  reg start = 0;
  reg [7:0] data = 8'h41;          // 'A'
  wire tx, busy;
  uart_tx #(.DIV(2)) dut(.clk(clk), .start(start), .data(data), .tx(tx), .busy(busy)); // DIV=2 to simulate
  always #5 clk = ~clk;
  integer k;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb);
    @(negedge clk) start = 1; @(posedge clk); @(negedge clk) start = 0;
    for (k=0;k<11;k=k+1) begin repeat (2) @(posedge clk); #1
      $display("bit %0d: tx=%b busy=%b", k, tx, busy); end
    $finish;
  end
endmodule
```

Expected (Icarus): `tx` sends `0` (start), then `0x41` LSB-first (`1,0,0,0,0,0,1,0`), then `1` (stop); `busy` drops at the end.

## Example 7 — Using an IP core: rPLL

1. Gowin → **IP Core Generator** → **rPLL**.
2. Input 27 MHz, request a target output, generate the module.
3. Instantiate the generated `rPLL`; feed its clock into your design.

Trade-off: a counter divider is portable and *simulatable*; a PLL is exact but vendor-specific
and does **not** simulate in VeriSim. Verify logic with a divider; swap in the PLL on hardware.

## What to look for

- **Scaling the divider** is the core skill: the design that "works in simulation" with a tiny
  divider and "works on the board" with a huge one is *the same design*.
- **UART framing on the waveform**: idle-high, one start-bit dip, eight LSB-first data bits,
  stop bit. Debug framing in the browser, not with a scope.

## Exercises (session 2)

1. **Counter/shift on LEDs.** Build and run examples 3 on the board (small divider to simulate
   first).
2. **BABA on hardware.** Map the Week-11 BABA detector's `A,B,C,D` to buttons (you have two
   buttons — use timing or a small input encoding) and `Y` to an LED.
3. **UART message.** Wrap `uart_tx` to auto-send 'A' once per second; decode at 115200 8N1.
4. **PLL vs divider.** Generate an rPLL for a target frequency and compare exactness with a
   counter divider.
