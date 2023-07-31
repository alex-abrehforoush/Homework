module testM_counter (
    
);
    reg [18:0] Count_m;
    reg Pulse1000, Pulse2000, Pulse5000, Clock, Reset;
    wire Out;
    wire [8:0] c_1000;
    wire [7:0] c_2000;
    wire [6:0] c_5000;

    m_counter tester(.Count_m(Count_m), .Pulse1000(Pulse1000), .Pulse2000(Pulse2000), .Pulse5000(Pulse5000), .Clock(Clock), .Reset(Reset), .Out(Out), .c_1000(c_1000), .c_2000(c_2000), .c_5000(c_5000));

	initial begin
        Clock = 1;
        repeat(200) begin
            #5 Clock = ~Clock;
        end
    end
    initial
		begin
			$monitor("%d	Count_m = %b, Pulse1000 = %b, Pulse2000 = %b, Pulse5000 = %b, Clock = %b, Reset = %b, Out = %b, c_1000 = %b, c_2000 = %b, c_5000 = %b", $time, Count_m, Pulse1000, Pulse2000, Pulse5000, Clock, Reset, Out, c_1000, c_2000, c_5000);
			
            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b0;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b1;
            Pulse5000 = 1'b0;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b1;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b1;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b1;
            Pulse5000 = 1'b0;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b1;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b0;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b1;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b0;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b1;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b0;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b1;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b0;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b1;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b0;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b0;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b1;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b0;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;

            #10
            Pulse1000 = 1'b0;
            Pulse2000 = 1'b0;
            Pulse5000 = 1'b1;
            Count_m = 19'b000_0111_0101_0011_0000;
            Reset = 1'b1;
		end
endmodule

