module TestGame # (parameter N = 8)
(
);
    reg [N - 1:0] First_Num, Second_Num, Target_Num;
    reg Clock, Reset;
    wire [1:0] Result;

	initial
	begin
		Clock = 0;
		repeat(100) begin
			#5 Clock = ~Clock;
		end
	end

    Game g(.First_Num(First_Num), .Second_Num(Second_Num), .Target_Num(Target_Num), .Clock(Clock), .Reset(Reset), .Result(Result));
    initial
		begin
            $monitor("%d	First_Num = %b, Second_Num = %b, Target_Num = %b, Reset = %b, Result = %b", $time, First_Num, Second_Num, Target_Num, Reset, Result);
            
			Target_Num <= 8'b11001100;
			Reset = 0;
			#5			
			First_Num  <= 8'b00001111;
			Second_Num <= 8'b11100011;
			
			#10
			First_Num  <= 8'b10101000;
			Second_Num <= 8'b11000000;
			
			#10
			First_Num  <= 8'b10110000;   
			Second_Num <= 8'b00111111;

			#10
			First_Num  <= 8'b00000000;
			Second_Num <= 8'b00000001;
			
			#10
			First_Num  <= 8'b11001101;        
			Second_Num <= 8'b00100101;
			
			#10
			First_Num  <= 8'b11100111;
			Second_Num <= 8'b00001111;
			
			#10
			First_Num  <= 8'b01111111;
			Second_Num <= 8'b10101111;
			
			#10
			First_Num  <= 8'b00101111;
			Second_Num <= 8'b00101111;
			
			#10
			First_Num  <= 8'b11111110;
			Second_Num <= 8'b10000001;
			
			#10
			First_Num  <= 8'b00000001;
			Second_Num <= 8'b01010111;

            
		end
endmodule
