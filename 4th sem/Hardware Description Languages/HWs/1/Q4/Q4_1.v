
module RailWay(input [7:0] a, b, input sel, output [7:0] c, d);
	assign c = sel ? b : a;
	assign d = sel ? a : b;
endmodule