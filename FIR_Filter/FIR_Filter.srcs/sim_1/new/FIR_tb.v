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

`define Order_of_filter 50
`define data_bus 32
module FIR_tb();
reg sample_clk=0;
reg [`data_bus-1:0] ip_signal;
wire [`data_bus-1:0] op_signal;
reg [`data_bus-1:0] ip_buff [3000:0];
integer i=0;

FIR_Filter dut(sample_clk, ip_signal, op_signal);
integer file; // File descriptor
initial begin
  // Open a file in write mode
    file = $fopen("Output.txt", "w");
    $readmemh("Input.txt", ip_buff);
    if (file == 0) begin
      $display("Error: Could not open file.");
      $finish;
    end
    $fwrite(file, "Simulation Results:\n");
    // Close the file
    
forever #5 sample_clk = ~sample_clk;
#3000 $finish;
$fclose(file);
$display("Data written to Output.txt");

end

always @(negedge sample_clk) begin
ip_signal = ip_buff[i];
    i = i+1;
    $fwrite(file,op_signal,"\n");
end


endmodule
