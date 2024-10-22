
module TestFullAdder;
	reg aa, bb, carry_in;
	wire carry_out, f_sum;
	FullAdder x(aa, bb, carry_in, carry_out, f_sum);
	initial
		begin
			$monitor("%d aa=%b, bb=%b, carry_in=%b, carry_out=%b, f_sum=%b", $time, aa, bb, carry_in, carry_out, f_sum);
			
			#20
			aa = 1'b0;
			bb = 1'b0;
			carry_in = 1'b0;
			
			#20
			aa = 1'b0;
			bb = 1'b0;
			carry_in = 1'b1;
			
			#20
			aa = 1'b0;
			bb = 1'b1;
			carry_in = 1'b0;
			
			#20
			aa = 1'b0;
			bb = 1'b1;
			carry_in = 1'b1;
			
			#20
			aa = 1'b1;
			bb = 1'b0;
			carry_in = 1'b0;
			
			#20
			aa = 1'b1;
			bb = 1'b0;
			carry_in = 1'b1;
			
			#20
			aa = 1'b1;
			bb = 1'b1;
			carry_in = 1'b0;
			
			#20
			aa = 1'b1;
			bb = 1'b1;
			carry_in = 1'b1;
		end
endmodule