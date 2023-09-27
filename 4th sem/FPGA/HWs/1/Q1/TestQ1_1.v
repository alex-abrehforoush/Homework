
module TestHalfAdder;
	reg a, b;
	wire carry, sum;
	HalfAdder tester(a, b, carry, sum);
	initial
		begin
			$monitor("%d a=%b, b=%b, carry=%b, sum=%b", $time, a, b, carry, sum);
			#20
			a = 1'b0;
			b = 1'b0;
			
			#20
			a = 1'b0;
			b = 1'b1;
			
			#20
			a = 1'b1;
			b = 1'b0;
			
			#20
			a = 1'b1;
			b = 1'b1;
		end
endmodule