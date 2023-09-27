module MultiplexerD
	(input a, b, s, output w);
	reg w;
	always @(a, b, s) begin
		if(s) w = b;
		else w = a;
	end
endmodule
