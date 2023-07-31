`timescale 1ns/100ps
module Detector110Tester
	;
	reg aa, clock, rst;
	wire ww;
	Detector110 UUT (aa, clock, rst, ww);
	initial begin
		aa =  0;
		clock = 0;
		rst = 1;
	end
	initial repeat (44) #7 clock = ~clock;
	initial repeat (15) #23 aa = ~aa;
	initial begin
		#31 rst = 1;
		#31 rst = 0;
	end
	always @(ww) if (ww == 1)
		$display("A 1 was detected on w at time %t", $time);
	end
endmodule
