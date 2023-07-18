module PC (
    input wire [31:0] din,
    input wire rst,
    input wire clk,
    output reg [31:0] pc
);
    reg [31:0] curr_adr;
    // anyway curr_adr is the current adr now 
    // the curr_adr should be the output
    always @(*) begin
        pc = curr_adr;
    end
    
    always @(posedge clk or negedge rst) begin
        if (rst == 1) begin
            curr_adr <= 32'b0;
        end else begin
            curr_adr <= din;
        end
    end
endmodule