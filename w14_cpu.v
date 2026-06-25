// Single-cycle RV32I (subset). The program is embedded inline (no $readmemh,
// no firmware), so it runs in VeriSim with no toolchain. Pair with testbench.v.

// register file: 32 x 32-bit, x0 hardwired to 0
module regfile(
    input             clk,
    input      [4:0]  rs1, rs2, rd,
    input             we,
    input      [31:0] wd,
    output     [31:0] rd1, rd2
);
    reg [31:0] r [0:31];
    integer k;
    initial for (k = 0; k < 32; k = k + 1) r[k] = 32'b0;
    assign rd1 = (rs1 == 5'd0) ? 32'b0 : r[rs1];
    assign rd2 = (rs2 == 5'd0) ? 32'b0 : r[rs2];
    always @(posedge clk)
        if (we && rd != 5'd0) r[rd] <= wd;
endmodule

// CPU core
module cpu(
    input             clk,
    input             rst,
    output reg [31:0] pc,
    output     [31:0] dmem0       // expose data memory word 0 for checking
);
    // instruction memory (word addressed)
    reg [31:0] imem [0:63];
    integer i;
    initial begin
        for (i = 0; i < 64; i = i + 1) imem[i] = 32'h00000013; // NOP
        imem[0] = 32'h00000093;   // addi x1, x0, 0     ; sum = 0
        imem[1] = 32'h00100113;   // addi x2, x0, 1     ; i = 1
        imem[2] = 32'h00b00193;   // addi x3, x0, 11    ; limit = 11
        imem[3] = 32'h00310863;   // beq  x2, x3, done
        imem[4] = 32'h002080b3;   // add  x1, x1, x2    ; sum += i
        imem[5] = 32'h00110113;   // addi x2, x2, 1     ; i++
        imem[6] = 32'hff5ff06f;   // jal  x0, loop
        imem[7] = 32'h00102023;   // sw   x1, 0(x0)     ; done: store sum
        imem[8] = 32'h0000006f;   // jal  x0, 0         ; halt (self loop)
    end

    // data memory
    reg [31:0] dmem [0:63];
    initial for (i = 0; i < 64; i = i + 1) dmem[i] = 32'b0;
    assign dmem0 = dmem[0];

    // fetch
    wire [31:0] instr = imem[pc[31:2]];

    // decode fields
    wire [6:0] opcode = instr[6:0];
    wire [4:0] rd     = instr[11:7];
    wire [2:0] f3     = instr[14:12];
    wire [4:0] rs1    = instr[19:15];
    wire [4:0] rs2    = instr[24:20];
    wire [6:0] f7     = instr[31:25];

    // immediates
    wire [31:0] immI = {{20{instr[31]}}, instr[31:20]};
    wire [31:0] immS = {{20{instr[31]}}, instr[31:25], instr[11:7]};
    wire [31:0] immB = {{19{instr[31]}}, instr[31], instr[7],
                        instr[30:25], instr[11:8], 1'b0};
    wire [31:0] immU = {instr[31:12], 12'b0};
    wire [31:0] immJ = {{11{instr[31]}}, instr[31], instr[19:12],
                        instr[20], instr[30:21], 1'b0};

    // register file
    wire [31:0] rdata1, rdata2;
    reg         regwrite;
    reg  [31:0] wdata;
    regfile RF(.clk(clk), .rs1(rs1), .rs2(rs2), .rd(rd),
               .we(regwrite), .wd(wdata), .rd1(rdata1), .rd2(rdata2));

    // ALU
    reg  [31:0] alu;
    always @(*) begin
        case (opcode)
            7'b0010011: begin                  // I-type ALU
                case (f3)
                    3'b000: alu = rdata1 + immI;                       // addi
                    3'b111: alu = rdata1 & immI;                       // andi
                    3'b110: alu = rdata1 | immI;                       // ori
                    3'b100: alu = rdata1 ^ immI;                       // xori
                    3'b001: alu = rdata1 << immI[4:0];                 // slli
                    3'b101: alu = rdata1 >> immI[4:0];                 // srli
                    3'b010: alu = ($signed(rdata1) < $signed(immI)) ? 32'd1 : 32'd0; // slti
                    3'b011: alu = (rdata1 < immI) ? 32'd1 : 32'd0;     // sltiu
                    default: alu = 32'b0;
                endcase
            end
            7'b0110011: begin                  // R-type
                case (f3)
                    3'b000: alu = (f7[5]) ? (rdata1 - rdata2) : (rdata1 + rdata2); // sub/add
                    3'b111: alu = rdata1 & rdata2;                     // and
                    3'b110: alu = rdata1 | rdata2;                     // or
                    3'b100: alu = rdata1 ^ rdata2;                     // xor
                    3'b001: alu = rdata1 << rdata2[4:0];               // sll
                    3'b101: alu = rdata1 >> rdata2[4:0];               // srl
                    3'b010: alu = ($signed(rdata1) < $signed(rdata2)) ? 32'd1 : 32'd0; // slt
                    3'b011: alu = (rdata1 < rdata2) ? 32'd1 : 32'd0;   // sltu
                    default: alu = 32'b0;
                endcase
            end
            7'b0110111: alu = immU;             // lui
            7'b0000011: alu = rdata1 + immI;    // lw  (address)
            7'b0100011: alu = rdata1 + immS;    // sw  (address)
            default:    alu = 32'b0;
        endcase
    end

    // branch decision
    reg branch_taken;
    always @(*) begin
        branch_taken = 1'b0;
        if (opcode == 7'b1100011)
            case (f3)
                3'b000: branch_taken = (rdata1 == rdata2);                  // beq
                3'b001: branch_taken = (rdata1 != rdata2);                  // bne
                3'b100: branch_taken = ($signed(rdata1) < $signed(rdata2)); // blt
                default: branch_taken = 1'b0;
            endcase
    end

    // write-back source select
    always @(*) begin
        regwrite = 1'b0;
        wdata    = 32'b0;
        case (opcode)
            7'b0010011, 7'b0110011, 7'b0110111: begin regwrite = 1'b1; wdata = alu;            end // ALU / lui
            7'b0000011:                         begin regwrite = 1'b1; wdata = dmem[alu[31:2]]; end // lw
            7'b1101111:                         begin regwrite = 1'b1; wdata = pc + 32'd4;      end // jal
            default: ;
        endcase
    end

    // next PC + sequential state
    always @(posedge clk) begin
        if (rst) pc <= 32'b0;
        else begin
            if (opcode == 7'b0100011) dmem[alu[31:2]] <= rdata2;   // sw
            if      (opcode == 7'b1101111) pc <= pc + immJ;        // jal
            else if (branch_taken)         pc <= pc + immB;        // taken branch
            else                           pc <= pc + 32'd4;
        end
    end
endmodule
