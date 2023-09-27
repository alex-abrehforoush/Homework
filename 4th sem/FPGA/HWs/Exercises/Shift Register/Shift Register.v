`timescale 1ns/100ps
module ShiftRegister
	(input sl, sr, clk, input [7:0] par_in, input [1:0] m, output reg [7:0] par_out);
	always @(negedge clk) begin
		case (m)
		    0: par_out <= par_out;
		    1: par_out <= {sl, par_out[7:1]};
		    2: par_out <= {par_out[6:0], sr};
		    3: par_out <= par_in;
		    default: par_out <= 8 'bX;
		endcase
	end
endmodule
