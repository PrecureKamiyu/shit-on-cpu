`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// * TODO select B
// * TODO connect module ALU
// ** TODO B sel macro define
// * TODO connect module branch
//////////////////////////////////////////////////////////////////////////////////


module EX(
    // Controls
    input wire [3:0] alu_op,
    input wire b_sel,    
    input wire [1:0] br_op,
    
    // data
    input wire [31:0] A,
    input wire [31:0] sext_ext,
    input wire [31:0] rf_rD2,

    // output
    output wire [31:0] C,
    output wire f
    );
    
    reg [31:0] B;
    // this one seems so unnecessary
    always @(*) begin
        case (b_sel)
        `B_SEL_RD2: B = rf_rD2;
        `B_SEL_EXT: B = sext_ext;
        default:    B = 32'b0;
        endcase
    end
    
    ALU EX_ALU (
        .op(alu_op),
        .A(A),
        .B(B),
        .C(C)
    );
    
    branch EX_branch (
        .op(br_op),
        .C(C),
        .f(f)
    );
    
endmodule
