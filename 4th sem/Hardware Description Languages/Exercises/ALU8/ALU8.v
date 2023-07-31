`timescale 1ns/100ps
module ALU8
	(input [7:0] left, right, input [1:0] mode, output reg [7:0] res);
	always @(left, right, mode) begin
		case (mode)
			0: res = left + right;
			1: res = left - right;
			2: res = left & right;
			3: res = left | right;
			default: res = 8 'bX;
		endcase
	end
endmodule
