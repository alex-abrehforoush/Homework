
module TestOneBitCounter;
	reg [6:0] data_in;
	wire [2:0] data_out;
	OneBitCounter x(.data_in(data_in), .data_out(data_out));
	initial
		begin
			$monitor("%d data_in=%b, data_out=%b", $time, data_in, data_out);
		
			#20
			data_in = 7'b0000000;

			#20
			data_in = 7'b1000000;

			#20
			data_in = 7'b1000010;

			#20
			data_in = 7'b1000011;

			#20
			data_in = 7'b1001101;

			#20
			data_in = 7'b1011101;

			#20
			data_in = 7'b0110111;

			#20
			data_in = 7'b1111111;

			#20
			data_in = 7'b1001000;

			#20
			data_in = 7'b1001001;

			#20
			data_in = 7'b0001010;

			#20
			data_in = 7'b1101011;

			#20
			data_in = 7'b1001100;

			#20
			data_in = 7'b1111101;
		end
endmodule