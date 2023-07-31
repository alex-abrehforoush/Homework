module testBinary_Divisibility_By_7 (
    
);
    reg String, Clock, Reset;
    wire [2:0]  Remainder;
    wire Divisible;

    Binary_Divisibility_By_7 tester(.String(String), .Clock(Clock), .Reset(Reset), .Remainder(Remainder), .Divisible(Divisible));

	initial begin
        Clock = 0;
        repeat(200) begin
            #5 Clock = ~Clock;
        end
    end
    initial
		begin
            $monitor("%d	String = %b, Clock = %b, Reset = %b, Remainder = %b, Divisible = %b", $time, String, Clock, Reset, Remainder, Divisible);
            String = 0;
            Reset = 0;
            
            #10
            String = 0;
            Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 1;
            Reset = 0;
            #10
            String = 1;
            Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 1;
            Reset = 0;
            #10
            String = 1;
            Reset = 0;
            #10
            String = 1;
			Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 0;
            Reset = 1;
            #10
            String = 1;
            Reset = 0;
            #10
            String = 1;
            Reset = 1;
            #10
            String = 0;
            Reset = 1;
            #10
            String = 1;
            Reset = 1;
            #10
            String = 1;
            Reset = 0;
            #10
            String = 1;
			Reset = 0;
		end
endmodule

