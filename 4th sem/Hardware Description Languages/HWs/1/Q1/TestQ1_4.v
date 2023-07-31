
module TestFourBitFullAdder;
	reg [3:0] a;
	reg [3:0] b;
	reg carry_in;
	wire [3:0] sum;
	wire carry_out;
	FourBitFullAdder x(.a(a), .b(b), .carry_in(carry_in), .sum(sum), .carry_out(carry_out));
	initial
		begin
			$monitor("%d	a = %b, b = %b, carry_in = %b, sum = %b, carry_out = %b", $time, a, b, carry_in, sum, carry_out);
			
			#20
			a = 4'b0011;
			b = 4'b1011;
			carry_in = 0;
			
			#20
			a = 4'b1111;
			b = 4'b1111;
			carry_in = 0;
			
			#20
			a = 4'b0001;
			b = 4'b0111;
			carry_in = 0;
			
			#20
			a = 4'b0011;
			b = 4'b0011;
			carry_in = 1;
			
			#20
			a = 4'b1010;
			b = 4'b0110;
			carry_in = 0;
			
			#20
			a = 4'b1111;
			b = 4'b1111;
			carry_in = 1;
		end
endmodule