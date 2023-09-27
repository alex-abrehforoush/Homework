
module TestFourByOneMux;
	reg a3, a2, a1, a0;
	reg [1:0] s;
	wire d;
	FourByOneMux tester(.a3(a3), .a2(a2), .a1(a1), .a0(a0), .s(s), .d(d));
	initial
		begin
			$monitor("%d	a3 = %b, a2 = %b, a1 = %b, a0 = %b, s = %b, d = %b", $time, a3, a2, a1, a0, s, d);

			#20
			a3 = 1'b1;
			a2 = 1'b1;
			a1 = 1'b0;
			a0 = 1'b1;
			s = 2'b00;

			#20
			a3 = 1'b0;
			a2 = 1'b0;
			a1 = 1'b0;
			a0 = 1'b1;
			s = 2'b01;

			#20
			a3 = 1'b0;
			a2 = 1'b1;
			a1 = 1'b0;
			a0 = 1'b1;
			s = 2'b10;

			#20
			a3 = 1'b0;
			a2 = 1'b1;
			a1 = 1'b1;
			a0 = 1'b1;
			s = 2'b11;

		end
endmodule