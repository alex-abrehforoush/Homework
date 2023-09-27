
module OneBitCounter(input [6:0] data_in, output [2:0] data_out);
	wire x_s, x_c, y_s, y_c, z_s, z_c, w_s, w_c;
	FullAdder x(.aa(data_in[6]), .bb(data_in[5]), .carry_in(data_in[4]), .carry_out(x_c), .f_sum(x_s));
	FullAdder y(.aa(data_in[3]), .bb(data_in[2]), .carry_in(data_in[1]), .carry_out(y_c), .f_sum(y_s));
	FullAdder z(.aa(data_in[0]), .bb(x_s), .carry_in(y_s), .carry_out(z_c), .f_sum(z_s));
	FullAdder w(.aa(x_c), .bb(y_c), .carry_in(z_c), .carry_out(w_c), .f_sum(w_s));
	assign data_out[0] = z_s;
	assign data_out[1] = w_s;
	assign data_out[2] = w_c;
endmodule