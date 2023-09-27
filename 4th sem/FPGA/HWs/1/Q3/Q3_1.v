
module FourByOneMux(input a3, a2, a1, a0, [1:0] s, output d);
	wire [1:0] s_not;
	not(s_not[1], s[1]);
	not(s_not[0], s[0]);
	wire [3:0] aa;
	and(aa[0], a0, s_not[1], s_not[0]);
	and(aa[1], a1, s_not[1], s[0]);
	and(aa[2], a2, s[1], s_not[0]);
	and(aa[3], a3, s[1], s[0]);
	or(d, aa[3], aa[2], aa[1], aa[0]);
endmodule