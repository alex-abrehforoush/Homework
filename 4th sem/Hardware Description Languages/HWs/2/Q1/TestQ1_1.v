module testMyReg (
    
);
    reg clk, reset, load, serial_in, shift_right, shift_left;
    reg [7:0] pdata;
    wire [7:0] qdata;
    wire serial_out;
    myReg tester(.clk(clk), .reset(reset), .pdata(pdata), .qdata(qdata), .load(load), .shift_right(shift_right), .shift_left(shift_left), .serial_in(serial_in), .serial_out(serial_out));
	initial begin
        clk = 0;
        repeat(200) begin
            #5 clk = ~clk;
        end
    end
    initial
		begin
			$monitor("%d	clk = %b, reset = %b, pdata = %b, qdata = %b, load = %b, shift_right = %b, shift_left = %b, serial_in = %b, serial_out = %b", $time, clk, reset, pdata, qdata, load, shift_right, shift_left, serial_in, serial_out);
            
			#20
            reset = 0;
            load = 1;
            serial_in = 1;
            shift_right = 0;
            shift_left = 1;
            pdata = 8'b0001_0111;

            #20
            reset = 0;
            load = 0;
            serial_in = 1;
            shift_right = 0;
            shift_left = 1;
            pdata = 8'b0001_0111;

            #20
            reset = 0;
            load = 0;
            serial_in = 1;
            shift_right = 0;
            shift_left = 1;
            pdata = 8'b0001_0111;

            #20
            reset = 0;
            load = 0;
            serial_in = 1;
            shift_right = 1;
            shift_left = 0;
            pdata = 8'b0001_0111;

            #20
            reset = 1;
            load = 0;
            serial_in = 1;
            shift_right = 0;
            shift_left = 1;
            pdata = 8'b0001_0111;

		end
endmodule
