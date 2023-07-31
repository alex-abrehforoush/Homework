
module OneByTwoDecoder(input data_in, enable, output [1:0] data_out);
	assign data_out[1] = data_in & enable;
	assign data_out[0] = ~data_in & enable;
endmodule