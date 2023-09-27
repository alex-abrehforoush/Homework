`timescale 1ns/100ps
module FlipFlop(preset, reset, din, clk, qout);
	input preset, reset, din, clk;
	output qout;
	reg qout;
	always @(posedge clk) begin
		if(reset) qout <= #7 0;
		else if(preset) qout <= #7 1;
		else
			qout <= #8 din;
	end
endmodule
