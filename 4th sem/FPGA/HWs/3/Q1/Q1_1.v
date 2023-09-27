`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:25:29 05/19/2021 
// Design Name: 
// Module Name:    Q1_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module myReg (
    clk, reset, pdata, qdata, load, shift_right, shift_left, serial_in, serial_out
);
    input clk, reset, load, serial_in, shift_right, shift_left;
    input [7:0] pdata;
    output [7:0] qdata;
    output serial_out;

    reg [7:0] qdata;
    reg serial_out;
    always @(posedge clk) begin
        if (reset) begin
            qdata <= 8'b0000_0000;
            serial_out <= 1'b0;
        end

        else if (load) begin
            qdata <= pdata;
            serial_out <= 1'b0;
        end

        else if (shift_right) begin
            qdata[7] <= serial_in;
            qdata[6:0] <= qdata[7:1];
            serial_out <= qdata[0];
        end

        else if (shift_left) begin
            qdata[0] <= serial_in;
            qdata[7:1] <= qdata[6:0];
            serial_out <= qdata[7];
        end

        else begin
        end
    end
endmodule
