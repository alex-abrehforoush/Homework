module ANDOR
	(input i1, i2, i3, i4, output y);
	assign y = (i1 & i2) | (i3 & i4);
endmodule

module MultiplexerE
	(input a, b, s, output w);
	wire s_bar;
	not n1 (s_bar, s);
	ANDOR U1 (a, s_bar, b, s, w);
endmodule