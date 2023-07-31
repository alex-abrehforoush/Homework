module MultiplexerC
	(input a, b, s, output w);
	assign w = s ? b : a;
endmodule
