`include "defines.vh"
module NPC (
    input wire [31:0] pc,
    input wire [31:0] offset,
    input wire br,
    input wire [1:0] npc_op,
    output reg [31:0] pc4,
    output reg [31:0] npc
);

    // pc4 is very simple here
    always @(*) begin
        pc4 = pc + 32'd4;
    end
    
    // npc
    always @(*) begin
        if (npc_op == `NPC_PC4) begin
            npc <= pc + 32'd4;
        end else if (npc_op == `NPC_ABSJMP) begin
            npc <= pc + offset;
        end else if (npc_op == `NPC_JMP) begin
            npc <= br ? pc + offset : pc + 32'd4;
        end else begin
            // do nothing here
        end
    end
endmodule