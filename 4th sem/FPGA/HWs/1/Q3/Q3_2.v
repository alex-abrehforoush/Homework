
module SixteenFourByOneMux(
	input
	[15:0] a3,
	[15:0] a2,
	[15:0] a1,
	[15:0] a0,
	[1:0] s, output [15:0] d
	);
	
	FourByOneMux x15(.a3(a3[15]), .a2(a2[15]), .a1(a1[15]), .a0(a0[15]), .s(s), .d(d[15]));
	FourByOneMux x14(.a3(a3[14]), .a2(a2[14]), .a1(a1[14]), .a0(a0[14]), .s(s), .d(d[14]));
	FourByOneMux x13(.a3(a3[13]), .a2(a2[13]), .a1(a1[13]), .a0(a0[13]), .s(s), .d(d[13]));
	FourByOneMux x12(.a3(a3[12]), .a2(a2[12]), .a1(a1[12]), .a0(a0[12]), .s(s), .d(d[12]));
	FourByOneMux x11(.a3(a3[11]), .a2(a2[11]), .a1(a1[11]), .a0(a0[11]), .s(s), .d(d[11]));
	FourByOneMux x10(.a3(a3[10]), .a2(a2[10]), .a1(a1[10]), .a0(a0[10]), .s(s), .d(d[10]));
	FourByOneMux x9(.a3(a3[9]), .a2(a2[9]), .a1(a1[9]), .a0(a0[9]), .s(s), .d(d[9]));
	FourByOneMux x8(.a3(a3[8]), .a2(a2[8]), .a1(a1[8]), .a0(a0[8]), .s(s), .d(d[8]));
	FourByOneMux x7(.a3(a3[7]), .a2(a2[7]), .a1(a1[7]), .a0(a0[7]), .s(s), .d(d[7]));
	FourByOneMux x6(.a3(a3[6]), .a2(a2[6]), .a1(a1[6]), .a0(a0[6]), .s(s), .d(d[6]));
	FourByOneMux x5(.a3(a3[5]), .a2(a2[5]), .a1(a1[5]), .a0(a0[5]), .s(s), .d(d[5]));
	FourByOneMux x4(.a3(a3[4]), .a2(a2[4]), .a1(a1[4]), .a0(a0[4]), .s(s), .d(d[4]));
	FourByOneMux x3(.a3(a3[3]), .a2(a2[3]), .a1(a1[3]), .a0(a0[3]), .s(s), .d(d[3]));
	FourByOneMux x2(.a3(a3[2]), .a2(a2[2]), .a1(a1[2]), .a0(a0[2]), .s(s), .d(d[2]));
	FourByOneMux x1(.a3(a3[1]), .a2(a2[1]), .a1(a1[1]), .a0(a0[1]), .s(s), .d(d[1]));
	FourByOneMux x0(.a3(a3[0]), .a2(a2[0]), .a1(a1[0]), .a0(a0[0]), .s(s), .d(d[0]));
endmodule