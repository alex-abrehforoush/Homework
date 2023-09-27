module MultiplexerB
	(input a, b, s, output w)
	assign w = (a & ~s) | (b & s);
endmodule
