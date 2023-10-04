
module TestSixteenFourByOneMux;
	reg [15:0] a3, a2, a1, a0;
	reg [1:0] s;
	wire [15:0] d;
	SixteenFourByOneMux tester(
		.a3(a3),
		.a2(a2),
		.a1(a1),
		.a0(a0),
		.s(s), .d(d)
	);
	initial
		begin
			$monitor("%d	a3 = %b, a2 = %b, a1 = %b, a0 = %b, s = %b, d = %b", $time, a3, a2, a1, a0, s, d);

			#20
			a3 = 16'b0000001000101011;
			a2 = 16'b1101011011111001;
			a1 = 16'b1111010110011001;
			a0 = 16'b1101001101010101;
			s = 2'b00;

			#20
			a3 = 16'b1011100000100010;
			a2 = 16'b0100010101101111;
			a1 = 16'b1011000101001011;
			a0 = 16'b1011011111110000;
			s = 2'b01;

			#20
			a3 = 16'b0010010111110000;
			a2 = 16'b1000000100100101;
			a1 = 16'b1111110000100000;
			a0 = 16'b1111101011010001;
			s = 2'b10;

			#20
			a3 = 16'b1000110010010110;
			a2 = 16'b1001110000000101;
			a1 = 16'b0001011110001100;
			a0 = 16'b1011100010001100;
			s = 2'b11;

		end
endmodule