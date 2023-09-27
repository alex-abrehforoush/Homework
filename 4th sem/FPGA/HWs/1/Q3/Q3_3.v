
module SixteenThirtyTwoByOneMux(
	input
	[15:0] a31,
	[15:0] a30,
	[15:0] a29,
	[15:0] a28,
	[15:0] a27,
	[15:0] a26,
	[15:0] a25,
	[15:0] a24,
	[15:0] a23,
	[15:0] a22,
	[15:0] a21,
	[15:0] a20,
	[15:0] a19,
	[15:0] a18,
	[15:0] a17,
	[15:0] a16,
	[15:0] a15,
	[15:0] a14,
	[15:0] a13,
	[15:0] a12,
	[15:0] a11,
	[15:0] a10,
	[15:0] a9,
	[15:0] a8,
	[15:0] a7,
	[15:0] a6,
	[15:0] a5,
	[15:0] a4,
	[15:0] a3,
	[15:0] a2,
	[15:0] a1,
	[15:0] a0,
	[4:0] s, output [15:0] d
	);
	
	wire [15:0] f_d7, f_d6, f_d5, f_d4, f_d3, f_d2, f_d1, f_d0;//'f' -> first
	wire [15:0] s_d1, s_d0;//'s' -> second
	wire [15:0] t_d;//'t' -> third
	SixteenFourByOneMux x7(.a3(a31), .a2(a30), .a1(a29), .a0(a28), .s(s[1:0]), .d(f_d7));
	SixteenFourByOneMux x6(.a3(a27), .a2(a26), .a1(a25), .a0(a24), .s(s[1:0]), .d(f_d6));
	SixteenFourByOneMux x5(.a3(a23), .a2(a22), .a1(a21), .a0(a20), .s(s[1:0]), .d(f_d5));
	SixteenFourByOneMux x4(.a3(a19), .a2(a18), .a1(a17), .a0(a16), .s(s[1:0]), .d(f_d4));
	SixteenFourByOneMux x3(.a3(a15), .a2(a14), .a1(a13), .a0(a12), .s(s[1:0]), .d(f_d3));
	SixteenFourByOneMux x2(.a3(a11), .a2(a10), .a1(a9), .a0(a8), .s(s[1:0]), .d(f_d2));
	SixteenFourByOneMux x1(.a3(a7), .a2(a6), .a1(a5), .a0(a4), .s(s[1:0]), .d(f_d1));
	SixteenFourByOneMux x0(.a3(a3), .a2(a2), .a1(a1), .a0(a0), .s(s[1:0]), .d(f_d0));

	SixteenFourByOneMux  y1(.a3(f_d7), .a2(f_d6), .a1(f_d5), .a0(f_d4), .s(s[3:2]), .d(s_d1));
	SixteenFourByOneMux  y0(.a3(f_d3), .a2(f_d2), .a1(f_d1), .a0(f_d0), .s(s[3:2]), .d(s_d0));

	wire [1:0] final_select;
	assign final_select[0] = s[4];
	assign final_select[1] = 1'b0;
	wire my_zero = 16'b0000_0000_0000_0000;
	SixteenFourByOneMux z(.a3(my_zero), .a2(my_zero), .a1(s_d1), .a0(s_d0), .s(final_select), .d(t_d));
	assign d = t_d;

endmodule