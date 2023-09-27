
module TestOneByTwoDecoder;
	reg data_in, enable;
	wire [1:0] data_out;
	OneByTwoDecoder tester(.data_in(data_in), .enable(enable), .data_out(data_out));
	initial
		begin
			$monitor("%d	data_in = %b, enable = %b, data_out = %b", $time, data_in, enable, data_out);

			#20
			data_in = 1'b0;
			enable = 1'b0;

			#20
			data_in = 1'b0;
			enable = 1'b1;

			#20
			data_in = 1'b1;
			enable = 1'b0;

			#20
			data_in = 1'b1;
			enable = 1'b1;

		end
endmodule