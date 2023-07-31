
module TwoByFourDecoder(input [1:0] data_in, enable, output [3:0] data_out);
	wire [1:0] d_out_0;
	OneByTwoDecoder x2(.data_in(data_in[1]), .enable(enable), .data_out(d_out_0));
	OneByTwoDecoder x0(.data_in(data_in[0]), .enable(d_out_0[0]), .data_out(data_out[1:0]));
	OneByTwoDecoder x1(.data_in(data_in[0]), .enable(d_out_0[1]), .data_out(data_out[3:2]));
endmodule