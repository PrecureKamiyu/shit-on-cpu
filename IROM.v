module IROM (
    input wire [31:0] adr,
    output reg [31:0] inst
);
    reg [31:0] array [0:63]; 
    // here we define a very small array of 32-bit signal here.
    initial begin
        // you can initialize some instructions if you wish.
    end
    
    // TODO because I am afraid. So I only use the last few bits of the adr.
    // the last two bits of adr are 0's
    always @(*) begin
        inst = array[adr[7:2]];
    end
endmodule