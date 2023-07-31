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

    wire [63:0] temp_qdata [31:0];
    wire [63:0] temp_serial_out;
    wire [31:0] temp_data_out;
    
    //bufif0 U0(data_out[31:0], temp_qdata[reg_select][31:0], output_enable);
    assign serial_out = temp_serial_out[reg_select];
    genvar i;
    generate
        for (i = 63; i >= 0; i = i - 1) begin
            thirtyTwoBitMyReg RegisterBank(.clk(clk), .reset((reset && (i == reg_select)) || flush), .pdata(data_in), .qdata(temp_qdata[i]), .load(load && (i == reg_select)), .shift_right(shift_right && (i == reg_select)), .shift_left(shift_left && (i == reg_select)), .serial_in(serial_in), .serial_out(temp_serial_out[i]));
        end
    endgenerate
    
endmodule