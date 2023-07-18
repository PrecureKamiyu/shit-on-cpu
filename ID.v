`timescale 1ns / 1ps
module ID(
    input wire clk,
    
    // data part
    input wire [31:0] din,
    input wire [31:0] npc_pc4,
    
    // input wire [31:0] sext_ext,
    input wire [31:0] dram_rdo,
    input wire [31:0] alu_c,
    
    // control part
    input wire [1:0] rf_wsel,
    input wire rf_we,
    input wire [2:0] sext_op,
    
    // output part
    output wire rD1,
    output wire rD2,
    output wire ext
    );
    
    
    SEXT ID_SEXT (
        .din(din),
        .op(sext_op),
        .ext(ext)
    );
    
    wire [31:0] sext_ext;
    assign sext_ext = ext;

    reg [31:0] wD;
    always @(*) begin
        case (rf_wsel)
        `RF_WSEL_ALU: wD = alu_c;
        `RF_WSEL_PC4: wD = npc_pc4;
        `RF_WSEL_EXT: wD = sext_ext;
        `RF_WSEL_RDO: wD = dram_rdo;
        default: ;
        endcase
    end

    wire [31:0] rD1;
    wire [31:0] rD2;
    RF ID_RF (
        .clk(clk),
        .rR1(din[19:15]),
        .rR2(din[24:20]),
        .wR(din[11:7]),
        .wD(wD),
        .we(rf_we),
        
        .rD1(rD1),
        .rD2(rD2)
    );
endmodule
