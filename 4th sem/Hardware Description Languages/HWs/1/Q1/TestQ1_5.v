
module TestSixteenBitAddSub;
	reg [15:0] a;
	reg [15:0] b;
	reg add_sub;
	wire [15:0] result;
	wire carry_sign;
	SixteenBitAddSub x(.a(a), .b(b), .add_sub(add_sub), .result(result), .carry_sign(carry_sign));
	initial
		begin
			$monitor("%d	a = %b, b = %b, add_sub = %b, result = %b, carry_sign = %b", $time, a, b, add_sub, result, carry_sign);

			#20
			a = 16'b1011_0011_1110_0111;
			b = 16'b0110_1110_1101_1011;
			add_sub = 1'b0;

			#20
			a = 16'b1001_1111_1001_1000;
			b = 16'b0111_1110_0110_0011;
			add_sub = 1'b1;

			#20
			a = 16'b1001_0100_1100_1110;
			b = 16'b1010_1011_0101_1100;
			add_sub = 1'b0;

			#20
			a = 16'b1111_1111_1111_1111;
			b = 16'b0000_1100_0000_0010;
			add_sub = 1'b1;

			#20
			a = 16'b0110_1101_0101_0110;
			b = 16'b1101_0111_0011_1111;
			add_sub = 1'b0;

			#20
			a = 16'b1110_1010_1011_1110;
			b = 16'b0011_1000_0110_1111;
			add_sub = 1'b1;
		end
endmodule