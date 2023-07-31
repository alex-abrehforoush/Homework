module myReg (
    clk, reset, pdata, qdata, load, shift_right, shift_left, serial_in, serial_out
);
    input clk, reset, load, serial_in, shift_right, shift_left;
    input [7:0] pdata;
    output [7:0] qdata;
    output serial_out;

    reg [7:0] qdata;
    reg serial_out;

    always @(shift_right == 1) begin
        assign serial_out = qdata[0];
    end
    always @(shift_left == 1) begin
        assign serial_out = qdata[7];
    end
    always @(posedge clk) begin
        if (reset) begin
            qdata <= 8'b0000_0000;
        end

        else if (load) begin
            qdata <= pdata;
        end

        else if (shift_right) begin
            qdata[7] <= serial_in;
            qdata[6:0] <= qdata[7:1];
        end

        else if (shift_left) begin
            qdata[0] <= serial_in;
            qdata[7:1] <= qdata[6:0];
        end

        else begin
        end
    end
endmodule

module RFCorrelation # (parameter N = 32)
(
    input Bit_stream, Clock, Reset, output [3:0] Out_str
);
    Correlation_32 c();
    myReg r(.clk(Clock), .reset(Reset));
endmodule