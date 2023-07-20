`include "defines.vh"
module PC (
    input wire [31:0] npc,
    input wire rst,
    input wire clk,
    output wire [31:0] pc
);
    reg [31:0] curr_adr;
    
    always @(posedge clk or negedge rst) begin
        if (rst == 1) begin
            curr_adr <= 32'b0;
        end else begin
            curr_adr <= npc;
        end
    end

    assign pc = curr_adr;
endmodule