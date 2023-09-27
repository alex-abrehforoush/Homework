
module ThreeByEightDecoder(input [2:0] data_in, enable, output [7:0] data_out);
	
	wire [3:0] d_out;
	TwoByFourDecoder x(.data_in(data_in[2:1]), .enable(enable), .data_out(d_out));
	OneByTwoDecoder y0(.data_in(data_in[0]), .enable(d_out[0]), .data_out(data_out[1:0]));
	OneByTwoDecoder y1(.data_in(data_in[0]), .enable(d_out[1]), .data_out(data_out[3:2]));
	OneByTwoDecoder y2(.data_in(data_in[0]), .enable(d_out[2]), .data_out(data_out[5:4]));
	OneByTwoDecoder y3(.data_in(data_in[0]), .enable(d_out[3]), .data_out(data_out[7:6]));

endmodule