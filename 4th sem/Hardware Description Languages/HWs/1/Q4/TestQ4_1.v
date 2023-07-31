

module TestRailWay;
	reg [7:0] a;
	reg [7:0] b;
	reg sel;
	wire [7:0] c;
	wire [7:0] d;

	RailWay tester(.a(a), .b(b), .sel(sel), .c(c), .d(d));
	initial
		begin
			$monitor("%d	a = %b, b = %b, sel = %b, c = %b, d = %b", $time, a, b, sel, c, d);

			#20
			a = 8'b10010010;
			b = 8'b00011110;
			sel = 0;

			#20
			a = 8'b10011010;
			b = 8'b11111110;
			sel = 1;

			#20
			a = 8'b11010010;
			b = 8'b00100110;
			sel = 0;

			#20
			a = 8'b11111010;
			b = 8'b10101010;
			sel = 1;
		
		end
endmodule