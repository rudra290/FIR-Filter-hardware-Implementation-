`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2025 22:25:26
// Design Name: 
// Module Name: FIR_Filter
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


module FIR_Filter #(parameter no_coefficient = 10)(
    input sample_clk,
    input [15:0] ip_signal,
    output reg [15:0] op_signal
    );
    
reg [15:0] coeffi [no_coefficient - 1:0];
reg [3:0] n;
reg [15:0] ip_buffer [no_coefficient - 1:0];
reg [15:0] op_buffer = 0;
genvar i;
generate 
    for (i=0; i<no_coefficient; i=i+1) begin
     always @(negedge sample_clk) begin
        op_buffer = ip_signal;
        op_buffer = op_buffer + ip_buffer[no_coefficient - i - 1];
        end
    end
endgenerate
initial begin
     $readmemb("Coefficient.txt", coeffi);
end
always @(posedge sample_clk) begin
    ip_buffer[0] <= ip_signal;
    ip_buffer[1] <= ip_buffer[0];
    ip_buffer[2] <= ip_buffer[1];
    ip_buffer[3] <= ip_buffer[2];
    ip_buffer[4] <= ip_buffer[3];
    ip_buffer[5] <= ip_buffer[4];
    ip_buffer[6] <= ip_buffer[5];
    ip_buffer[7] <= ip_buffer[6];
    ip_buffer[8] <= ip_buffer[7];
    ip_buffer[9] <= ip_buffer[8];
    op_signal <= op_buffer;
end 

endmodule
