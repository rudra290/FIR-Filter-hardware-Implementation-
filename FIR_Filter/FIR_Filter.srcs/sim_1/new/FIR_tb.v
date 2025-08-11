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


`define data_bus 32
`define Order_of_filter 49
`define Sample_size 1600

module FIR_tb();

localparam CLK_PERIOD  = 12500;          
localparam NUM_SAMPLES = `Sample_size;        
reg                   sample_clk;
reg                   rst_n;       
reg  [`data_bus-1:0]  ip_signal;
wire [`data_bus-1:0]  op_signal;

reg  [`data_bus-1:0]  ip_buff [NUM_SAMPLES-1:0];

integer file, i;

FIR_Filter dut (
    .sample_clk(sample_clk),
    .rst_n(rst_n),
    .ip_signal(ip_signal),
    .op_signal(op_signal)
);

initial begin
    sample_clk = 0;
    forever #(CLK_PERIOD/2) sample_clk = ~sample_clk;
end


initial begin
    file = $fopen("Output.txt", "w");
    if (file == 0) begin
        $display("Error: Could not open Output.txt.");
        $finish;
    end
    $readmemh("Input.txt", ip_buff);

    rst_n = 1'b0; 
    i = 0;
    #(2 * CLK_PERIOD); 
    rst_n = 1'b1; 
    
    #((NUM_SAMPLES + `Order_of_filter + 5) * CLK_PERIOD);

    $fclose(file);
    $display("Simulation finished. Data written to Output.txt");
    $finish;
end

always @(negedge sample_clk or negedge rst_n) begin
    if (!rst_n) begin 
        ip_signal <= 0;
        i <= 0;
    end 
    else begin
        if (i < NUM_SAMPLES) begin
            ip_signal <= ip_buff[i];
            i <= i + 1;
        end 
        else begin
            ip_signal <= 0; 
        end
    end
end

always @(posedge sample_clk) begin
    if (rst_n && i > 1) begin
        $fwrite(file,"%h\n",op_signal);
    end
end

endmodule

