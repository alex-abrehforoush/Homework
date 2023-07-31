
module FourBitFullAdder(input [3:0] a, [3:0] b, carry_in, output [3:0] sum, carry_out);
	wire [3:0] x_carry;
	wire [3:0] x_sum;
	FullAdder x0(.aa(a[0]), .bb(b[0]), .carry_in(carry_in), .carry_out(x_carry[0]), .f_sum(x_sum[0]));
	FullAdder x1(.aa(a[1]), .bb(b[1]), .carry_in(x_carry[0]), .carry_out(x_carry[1]), .f_sum(x_sum[1]));
	FullAdder x2(.aa(a[2]), .bb(b[2]), .carry_in(x_carry[1]), .carry_out(x_carry[2]), .f_sum(x_sum[2]));
	FullAdder x3(.aa(a[3]), .bb(b[3]), .carry_in(x_carry[2]), .carry_out(x_carry[3]), .f_sum(x_sum[3]));
	assign sum = x_sum;
	assign carry_out = x_carry[3];
endmodule