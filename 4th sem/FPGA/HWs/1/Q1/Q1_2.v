
module FullAdder(input aa, bb, carry_in, output carry_out, f_sum);
	wire x_sum, x_carry, y_sum, y_carry;
	HalfAdder x(.a(aa), .b(bb), .carry(x_carry), .sum(x_sum));
	HalfAdder y(.a(carry_in), .b(x_sum), .carry(y_carry), .sum(y_sum));
	assign carry_out = x_carry | y_carry;
	assign f_sum = y_sum;
endmodule