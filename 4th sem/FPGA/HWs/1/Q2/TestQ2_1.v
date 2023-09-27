
module TestTwoByFourDecoder;
	reg [1:0] data_in;
	reg enable;
	wire [3:0] data_out;
	TwoByFourDecoder tester(.data_in(data_in), .enable(enable), .data_out(data_out));
	initial
		begin
			$monitor("%d	data_in = %b, enable = %b, data_out = %b", $time, data_in, enable, data_out);

			#20
			data_in = 2'b00;
			enable = 1'b0;

			#20
			data_in = 2'b01;
			enable = 1'b1;

			#20
			data_in = 2'b10;
			enable = 1'b0;

			#20
			data_in = 2'b11;
			enable = 1'b1;

			#20
			data_in = 2'b00;
			enable = 1'b1;

			#20
			data_in = 2'b01;
			enable = 1'b0;

			#20
			data_in = 2'b10;
			enable = 1'b1;

			#20
			data_in = 2'b11;
			enable = 1'b0;

		end
endmodule