module mcu4(input clk, input rst, output reg [3:0] out, output reg halted);
    localparam LDA=4'h1, LDB=4'h2, ADD=4'h3, SUB=4'h4, STS=4'h5, HLT=4'hF;
    localparam FETCH=2'd0, DECODE=2'd1, EXEC=2'd2;

    reg [7:0] rom [0:7];      // program memory
    reg [2:0] pc;             // program counter
    reg [7:0] ir;             // instruction register
    reg [3:0] acc, b;         // accumulator + B register
    reg [1:0] state;

    initial begin             // program bytes in HEX — these are exactly the values you see
        rom[0] = 8'h13;       // LDA 3 : ACC = 3        (opcode 1, immediate 3)
        rom[1] = 8'h22;       // LDB 2 : B   = 2        (opcode 2, immediate 2)
        rom[2] = 8'h30;       // ADD   : ACC = 3 + 2 = 5
        rom[3] = 8'h30;       // ADD   : ACC = 5 + 2 = 7
        rom[4] = 8'h40;       // SUB   : ACC = 7 - 2 = 5
        rom[5] = 8'h50;       // STS   : OUT = 5
        rom[6] = 8'hF0;       // HLT
        rom[7] = 8'hF0;       // HLT
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc<=0; acc<=0; b<=0; out<=0; halted<=0; ir<=0; state<=FETCH;
        end else case (state)
            FETCH:  begin ir <= rom[pc]; state <= DECODE; end
            DECODE: begin pc <= pc + 1'b1; state <= EXEC; end
            EXEC: begin
                case (ir[7:4])
                    LDA: acc <= ir[3:0];
                    LDB: b   <= ir[3:0];
                    ADD: acc <= acc + b;
                    SUB: acc <= acc - b;
                    STS: out <= acc;
                    HLT: halted <= 1'b1;
                endcase
                state <= (ir[7:4]==HLT) ? EXEC : FETCH;
            end
        endcase
    end
endmodule
