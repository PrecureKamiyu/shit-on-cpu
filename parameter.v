`ifndef CPU_PARAM
`define CPU_PARAM
    
    // npc op 2 bits
    `define NPC_PC4     'b00
    `define NPC_ABSJMP  'b01
    `define NPC_JMP     'b10
    
    `define SEXT_R 'b000
    `define SEXT_I 'b001
    `define SEXT_S 'b010
    `define SEXT_B 'b011
    `define SEXT_U 'b100
    `define SEXT_J 'b101
    `define SEXT_MOVE 'b110
    
    `define ALU_ADD 'b0001
    `define ALU_SUB 'b0010
    `define ALU_AND 'b0011
    `define ALU_OR  'b0100
    `define ALU_XOR 'b0101
    `define ALU_SLL 'b0110
    `define ALU_SRL 'b0111
    `define ALU_SRA 'b1000
    
    `define TRUE 1'b1
    `define FALSE 1'b0
    
    `define RF_WSEL_ALU 'b00
    `define RF_WSEL_PC4 'b01
    `define RF_WSEL_EXT 'b10
    `define RF_WSEL_RDO 'b11
    
    `define B_SEL_RD2 'b0
    `define B_SEL_EXT 'b1
    
    `define BR_NE 'b00
    `define BR_EQ 'b01
    `define BR_GE 'b10
    `define BR_LT 'b11
`endif