`include "defines.vh"

module ALU (
    input wire [1:0] op,
    input wire [31:0] A,
    input wire [31:0] B,
    output wire [31:0] C
);

reg[31:0] ans;

always @(*) begin
    case(op)
        `ALU_ADD : ans = A + B;
        `ALU_SUB : ans = A - B;
        `ALU_AND : ans = A & B;
        `ALU_OR  : ans = A | B;
        `ALU_XOR : ans = A ^ B;
        `ALU_SLL : ans = A << B[4:0];
        `ALU_SRL : ans = A >> B[4:0];
        `ALU_SRA : ans = ($signed(A)) >>> B[4:0];
        // this one!
        default  : ans = 32'b0;
    endcase
end

assign C = ans;

endmodule