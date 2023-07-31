module testCorrelation # (parameter N = 8)
(
);
    reg [N - 1:0] First_Num, Second_Num, Target_Num;
    wire [1:0] Correct_guess;
    wire [N + 2:0] Out_1, Out_2;
    reg Reset = 0;
    reg clk = 0;
    
    Correlation c(.clk(clk), .Reset(Reset), .First_Num(First_Num), .Second_Num(Second_Num), .Target_Num(Target_Num), .Correct_guess(Correct_guess), .Out_1(Out_1), .Out_2(Out_2));

	initial begin
        clk = 1;
        repeat(200) begin
            #5 clk = ~clk;
        end
    end
    initial
		begin
            $monitor("%d	Target_Num = %b, First_Num = %b, Second_Num = %b, Correct_guess = %b, Out_1 = %d, Out_2 = %d", $time, Target_Num, First_Num, Second_Num, Correct_guess, Out_1, Out_2);
            
            #10
            Target_Num = 8'b0000_1111;
            First_Num = 8'b1111_1100;
            Second_Num = 8'b0000_0000;

            #10
            Target_Num = 8'b0000_1111;
            First_Num = 8'b0000_1100;
            Second_Num = 8'b1100_0110;


            #10
            Target_Num = 8'b0000_1111;
            First_Num = 8'b1001_1100;
            Second_Num = 8'b0110_0000;

            #10
            Target_Num = 8'b0000_1111;
            First_Num = 8'b1000_1100;
            Second_Num = 8'b1111_1111;


		end
endmodule
