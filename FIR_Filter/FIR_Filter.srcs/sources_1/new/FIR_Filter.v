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
`define Order_of_filter 49
`define data_bus 32

module FIR_Filter #(
parameter no_coefficient = `Order_of_filter,
parameter data_bus = `data_bus
)(
    input sample_clk,rst_n,
    input [data_bus-1:0] ip_signal,
    output reg [data_bus-1:0] op_signal
    );
    
reg [data_bus-1:0] coeffi [no_coefficient - 1:0];
reg [3:0] n;
reg [data_bus-1:0] ip_buffer [no_coefficient - 1:0];
reg [2*data_bus+5:0] op_buffer = 0;
integer i;
integer shift; 
    

initial begin
     
     for(i=0; i<no_coefficient ; i=i+1) begin
        coeffi[i] = 0;
        ip_buffer[i] = 0;
     end
    $readmemh("Coefficient.txt", coeffi);
end

always @(negedge sample_clk) begin
        if(rst_n) begin
            op_buffer = ip_signal;
            for (i=0; i<no_coefficient; i=i+1) begin
                op_buffer = op_buffer + {{3{coeffi[i][31]}},coeffi[i]}*{{3{ip_buffer[no_coefficient - i - 1][31]}},ip_buffer[no_coefficient - i - 1]};
            end
        end
end

always @(posedge sample_clk) begin
    if(rst_n) begin
        ip_buffer[0] <= ip_signal;
        for(shift=1; shift<no_coefficient;shift=shift+1) begin
            ip_buffer[shift] <= ip_buffer[shift-1];
        end
//    ip_buffer[1] <= ip_buffer[0];
//    ip_buffer[2] <= ip_buffer[1];
//    ip_buffer[3] <= ip_buffer[2];
//    ip_buffer[4] <= ip_buffer[3];
//    ip_buffer[5] <= ip_buffer[4];
//    ip_buffer[6] <= ip_buffer[5];
//    ip_buffer[7] <= ip_buffer[6];
//    ip_buffer[8] <= ip_buffer[7];
//    ip_buffer[9] <= ip_buffer[8];
        op_signal = op_buffer >> 38;
//        if (op_buffer[data_bus-1])  begin
//            op_signal = op_signal + 1;
//        end 
    end
end 

endmodule
