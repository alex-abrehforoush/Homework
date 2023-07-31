module testDecision
(
    
);
    reg [1:0] Correct_guess, In_wr;
    reg Clock, Reset;
    wire [1:0] Result;
	initial
	begin
		Reset = 0;
		Clock = 0;
		repeat(100) begin
			#5 Clock = ~Clock;
		end
	end
    Decision w(.clk(Clock), .Reset(Reset), .Correct_guess(Correct_guess), .In_wr(In_wr), .Result(Result));
    initial
		begin
            $monitor("%d	Correct_guess = %b, In_wr = %b, Reset = %b, Result = %b", $time, Correct_guess, In_wr, Reset, Result);
            
			
            #13
            Correct_guess = 2'b00;
            In_wr = 2'b11;
            
            #13
            Correct_guess = 2'b00;
            In_wr = 2'b01;
            
            #13
            Correct_guess = 2'b00;
            In_wr = 2'b10;

			#13
			Reset = 0;
            Correct_guess = 2'b00;
            In_wr = 2'b11;
            
            #13
            Correct_guess = 2'b00;
            In_wr = 2'b01;
            
            #13
            Correct_guess = 2'b00;
            In_wr = 2'b10;

			#13
			Reset = 0;
            Correct_guess = 2'b00;
            In_wr = 2'b11;
            
            #13
            Correct_guess = 2'b00;
            In_wr = 2'b01;
            
            #13
            Correct_guess = 2'b00;
            In_wr = 2'b10;

			#13
			Reset = 0;
            Correct_guess = 2'b00;
            In_wr = 2'b11;
            
            #13
            Correct_guess = 2'b00;
            In_wr = 2'b01;
            
            #13
            Correct_guess = 2'b00;
            In_wr = 2'b10;

			#13
			Reset = 0;
            Correct_guess = 2'b00;
            In_wr = 2'b01;
            
            #13
            Correct_guess = 2'b00;
            In_wr = 2'b01;
            
            #13
            Correct_guess = 2'b00;
            In_wr = 2'b10;

			#13
			Reset = 0;
            Correct_guess = 2'b00;
            In_wr = 2'b11;
            
            #13
            Correct_guess = 2'b10;
            In_wr = 2'b01;
            
            #13
            Correct_guess = 2'b01;
            In_wr = 2'b10;
            
		end
endmodule
