
module SixteenBitAddSub(input [15:0] a, [15:0] b, add_sub, output [15:0] result, carry_sign);
	wire add_sub_prim = ~add_sub;
	wire [15:0] c;
	assign c[15] = b[15] ^ add_sub_prim;
	assign c[14] = b[14] ^ add_sub_prim;
	assign c[13] = b[13] ^ add_sub_prim;
	assign c[12] = b[12] ^ add_sub_prim;
	assign c[11] = b[11] ^ add_sub_prim;
	assign c[10] = b[10] ^ add_sub_prim;
	assign c[9] = b[9] ^ add_sub_prim;
	assign c[8] = b[8] ^ add_sub_prim;
	assign c[7] = b[7] ^ add_sub_prim;
	assign c[6] = b[6] ^ add_sub_prim;
	assign c[5] = b[5] ^ add_sub_prim;
	assign c[4] = b[4] ^ add_sub_prim;
	assign c[3] = b[3] ^ add_sub_prim;
	assign c[2] = b[2] ^ add_sub_prim;
	assign c[1] = b[1] ^ add_sub_prim;
	assign c[0] = b[0] ^ add_sub_prim;
	wire x0_carry_out, x1_carry_out, x2_carry_out, x3_carry_out;
	FourBitFullAdder x0(.a(a[3:0]), .b(c[3:0]), .carry_in(add_sub_prim), .sum(result[3:0]), .carry_out(x0_carry_out));
	FourBitFullAdder x1(.a(a[7:4]), .b(c[7:4]), .carry_in(x0_carry_out), .sum(result[7:4]), .carry_out(x1_carry_out));
	FourBitFullAdder x2(.a(a[11:8]), .b(c[11:8]), .carry_in(x1_carry_out), .sum(result[11:8]), .carry_out(x2_carry_out));
	FourBitFullAdder x3(.a(a[15:12]), .b(c[15:12]), .carry_in(x2_carry_out), .sum(result[15:12]), .carry_out(x3_carry_out));
	assign carry_sign = x3_carry_out;
endmodule