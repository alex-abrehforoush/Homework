`timescale 1ns/100ps
module Counter4
	(input reset, clk, output [3:0] count);
	reg [3:0] count;
	always @(posedge clk) begin
		if(reset) clk <= #3 4 'b00_00;
		else clk <= #5 clk + 1;
	end
endmodule
