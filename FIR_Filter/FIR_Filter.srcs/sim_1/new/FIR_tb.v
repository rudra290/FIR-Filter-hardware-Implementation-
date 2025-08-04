`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2025 23:07:45
// Design Name: 
// Module Name: FIR_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIR_tb();
reg sample_clk=0;
reg [15:0] ip_signal;
wire [15:0] op_signal;

FIR_Filter dut(sample_clk, ip_signal, op_signal);

initial begin
forever #5 sample_clk = ~sample_clk;
end

always @(negedge sample_clk) begin
ip_signal = $random;
end
endmodule
