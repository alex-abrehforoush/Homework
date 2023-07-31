
module TestThreeByEightDecoder;
	reg [2:0] data_in;
	reg enable;
	wire [7:0] data_out;
	ThreeByEightDecoder tester(.data_in(data_in), .enable(enable), .data_out(data_out));
	initial
		begin
			$monitor("%d	data_in = %b, enable = %b, data_out = %b", $time, data_in, enable, data_out);

			#20
			data_in = 3'b010;
			enable = 1'b0;

			#20
			data_in = 3'b110;
			enable = 1'b1;

			#20
			data_in = 3'b111;
			enable = 1'b0;

			#20
			data_in = 3'b100;
			enable = 1'b1;

		end
endmodule