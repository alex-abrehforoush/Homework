`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:27 05/19/2021 
// Design Name: 
// Module Name:    Q1_2 
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
module thirtyTwoBitMyReg (
    clk, reset, pdata, qdata, load, shift_right, shift_left, serial_in, serial_out
);
    input clk, reset, load, serial_in, shift_right, shift_left;
    input [31:0] pdata;
    output [31:0] qdata;
    output serial_out;

    wire [3:0] temp_serial_in;
    wire [3:0] temp_serial_out;
    or(temp_serial_in[3], shift_right && serial_in, shift_left && temp_serial_out[2]);
    or(temp_serial_in[2], shift_right && temp_serial_out[3], shift_left && temp_serial_out[1]);
    or(temp_serial_in[1], shift_right && temp_serial_out[2], shift_left && temp_serial_out[0]);
    or(temp_serial_in[0], shift_right && temp_serial_out[1], shift_left && serial_in);
    or(serial_out, shift_right && temp_serial_out[0], shift_left && temp_serial_out[3]);

    myReg fourth_reg(.clk(clk), .reset(reset), .pdata(pdata[31:24]), .qdata(qdata[31:24]), .load(load), .shift_right(shift_right), .shift_left(shift_left), .serial_in(temp_serial_in[3]), .serial_out(temp_serial_out[3]));
    myReg third_reg(.clk(clk), .reset(reset), .pdata(pdata[23:16]), .qdata(qdata[23:16]), .load(load), .shift_right(shift_right), .shift_left(shift_left), .serial_in(temp_serial_in[2]), .serial_out(temp_serial_out[2]));
    myReg second_reg(.clk(clk), .reset(reset), .pdata(pdata[15:8]), .qdata(qdata[15:8]), .load(load), .shift_right(shift_right), .shift_left(shift_left), .serial_in(temp_serial_in[1]), .serial_out(temp_serial_out[1]));
    myReg first_reg(.clk(clk), .reset(reset), .pdata(pdata[7:0]), .qdata(qdata[7:0]), .load(load), .shift_right(shift_right), .shift_left(shift_left), .serial_in(temp_serial_in[0]), .serial_out(temp_serial_out[0]));
endmodule

module SixtyFourThirtyTwoBitMyReg (
    clk, flush, data_in, reg_select, output_enable, reset, load, shift_right, shift_left, serial_in, data_out, serial_out
);
    input clk, flush, output_enable, reset, load, shift_right, shift_left, serial_in;
    input [31:0] data_in;
    input [5:0] reg_select;
    output [31:0] data_out;
    output serial_out;	

    wire [63:0] reset_all;
	wire [63:0] load_all;
	wire [63:0] shift_right_all;
	wire [63:0] shift_left_all;
	wire [63:0] serial_in_all;
	
	
	reg [63:0] decoder;
	always @(reg_select) begin
		decoder = 64'h0;
		decoder[reg_select] = 1'b1;
	end
	
	wire [31:0] data_out_all [63:0];
	wire [63:0] serial_out_all;
	
	wire serial_out_reg;
	assign serial_out_reg = serial_out_all[reg_select];
	wire [31:0] data_out_reg;
	assign data_out_reg = data_out_all[reg_select];
	
	assign reset_all = flush ? 64'hffffffffffffffff : (reset ? decoder : 0 );
	assign load_all = load ? decoder : 0;
	assign shift_right_all = shift_right ? decoder : 0;
	assign shift_left_all = shift_left ? decoder : 0;
	assign serial_in_all = serial_in ? decoder : 0;
	
	genvar i;
	generate
		for (i = 0; i < 64; i = i + 1) begin : generate_block_identifier_1
			thirtyTwoBitMyReg RegisterBank(clk, reset_all[i], data_in, data_out_all[i], load_all[i], shift_right_all[i], shift_left_all[i], serial_in_all[i], serial_out_all[i]);
		end
		for (i = 0; i < 32; i = i + 1) begin : generate_block_identifier_2
			bufif1  buf_(data_out[i], data_out_reg[i], output_enable);
		end
	endgenerate
	bufif1  buf_(serial_out, serial_out_reg, output_enable);

endmodule


