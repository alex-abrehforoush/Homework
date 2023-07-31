module testSixtyFourThirtyTwoBitMyReg (
    
);
    reg clk, flush, output_enable, reset, load, shift_right, shift_left, serial_in;
    reg [31:0] data_in;
    reg [5:0] reg_select;
    wire [31:0] data_out;
    wire serial_out;
    SixtyFourThirtyTwoBitMyReg tester(.clk(clk), .flush(flush), .data_in(data_in), .reg_select(reg_select), .output_enable(output_enable), .reset(reset), .load(load), .shift_right(shift_right), .shift_left(shift_left), .serial_in(serial_in), .data_out(data_out), .serial_out(serial_out));
	initial begin
        clk = 0;
        repeat(200) begin
            #5 clk = ~clk;
        end
    end
    initial
		begin
			$monitor("%d	clk = %b, flush = %b, data_in = %b, reg_select = %b, output_enable = %b, reset = %b, load = %b, shift_right = %b, shift_left = %b, serial_in = %b, data_out = %b, serial_out = %b", $time, clk, flush, data_in, reg_select, output_enable, reset, load, shift_right, shift_left, serial_in, data_out, serial_out);
			#20
            flush=0;
            reset=0;
            load=1;
            output_enable=1;
            reg_select=6'b011011;
            shift_right=0;
            shift_left=0;
            serial_in=1;
            data_in=32'b0000_1111_0000_1111_0000_1111_0000_1111;

            #20
            flush=0;
            reset=0;
            load=0;
            output_enable=1;
            reg_select=6'b011011;
            shift_right=1;
            shift_left=0;
            serial_in=1;
            data_in=32'b0000_1111_0000_1111_0000_1111_0000_1111;

            #20
            flush=0;
            reset=0;
            load=0;
            output_enable=0;
            reg_select=6'b111001;
            shift_right=0;
            shift_left=0;
            serial_in=1;
            data_in=32'b0000_1111_0000_1111_0000_1111_0000_1111;

            #20
            flush=0;
            reset=1;
            load=0;
            output_enable=1;
            reg_select=6'b010001;
            shift_right=0;
            shift_left=1;
            serial_in=1;
            data_in=32'b0000_1111_0000_1111_0000_1111_0000_1111;

            #20
            flush=1;
            reset=0;
            load=1;
            output_enable=1;
            reg_select=6'b011011;
            shift_right=0;
            shift_left=0;
            serial_in=1;
            data_in=32'b0000_1111_0000_1111_0000_1111_0000_1111;

		end
endmodule
