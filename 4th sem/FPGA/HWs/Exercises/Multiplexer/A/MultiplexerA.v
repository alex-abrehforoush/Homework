module MultiplexerA
	(input a, b, s, output w);
	wire a_sel, b_sel, s_bar;
	not n1(s_bar, s);
	and a1(a_sel, a, s_bar);
	and a2(b_sel, b, s);
	or o1(w, a_sel, b_sel);
endmodule

