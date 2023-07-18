module RF (
    input wire clk,
    input wire [4:0] rR1,
    input wire [4:0] rR2,
    input wire [4:0] wR,
    input wire [31:0] wD,
    input wire we,
    
    output reg [31:0] rD1,
    output reg [31:0] rD2
);
    reg [31:0] array [0:31];
    
    always @(*) begin
        if (we == 0) begin 
            rD1 = array[rR1];
            rD2 = array[rR2];
        end else ;
    end
    
    always @(posedge clk) begin
        if (we) begin
            array[wR] <= wD;
        end else ;
    end
endmodule