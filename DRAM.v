`timescale 1ns / 1ps
module DRAM(
    input wire clk,
    input wire [31:0] adr,
    input wire we,
    input wire re,
    input wire [31:0] wdin,
    output reg [31:0] rdo
    );
endmodule
