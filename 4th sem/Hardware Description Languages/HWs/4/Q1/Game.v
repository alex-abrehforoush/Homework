module Game # (parameter N = 8)
(
    input [N - 1:0] First_Num, Second_Num, Target_Num, input Clock, Reset, output [1:0] Result
);
    wire [1:0] Correct_guess;
    wire [N + 2:0] Out_1, Out_2;
    wire [1:0] Out_wr;

    Correlation c(.clk(Clock), .Reset(Reset), .First_Num(First_Num), .Second_Num(Second_Num), .Target_Num(Target_Num), .Correct_guess(Correct_guess), .Out_1(Out_1), .Out_2(Out_2));
    Winner w(.In_1(Out_1), .In_2(Out_2), .Out_wr(Out_wr));
    Decision d(.clk(Clock), .Reset(Reset), .Correct_guess(Correct_guess), .In_wr(Out_wr), .Result(Result));

endmodule