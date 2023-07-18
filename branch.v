`timescale 1ns / 1ps

module branch(
    input wire [1:0] op,
    input wire [31:0] C,
    output wire f
);

reg ans;

always @(*) begin
    case (op)
        `BR_NE: ans = (C != 32'b0);
        `BR_EQ: ans = (C == 32'b0);
        `BR_GE: ans = (C >= 32'b0);
        `BR_LT: ans = (C <  32'b0);
        default:        ans = 1'b0;
    endcase
end

assign f = ans;

endmodule
