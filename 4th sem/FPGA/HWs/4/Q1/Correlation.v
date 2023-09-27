module Correlation # (parameter N = 8)
(
    input clk, Reset, input [N - 1:0] First_Num, Second_Num, Target_Num, output [1:0] Correct_guess, output reg [N + 2:0] Out_1 = 0, Out_2 = 0
);
    reg [3:0] counter = 0;
    always @(posedge clk or posedge Reset)
    begin
        if(Reset)
        begin
            Out_1 <= 0;
            Out_2 <= 0;
            counter <= counter + 1;
        end
        else
        begin
            if(counter < 10)
            begin
                if((First_Num == Target_Num) || (Second_Num == Target_Num))
                begin
                    Out_1 <= 0;
                    Out_2 <= 0;
                    counter <= 0;
                end
                else
                begin
                    Out_1 <= Out_1 + calcCorrelation(First_Num);
                    Out_2 <= Out_2 + calcCorrelation(Second_Num);
                    counter <= counter + 4'b0001;
                end
            end
            else
            begin
                Out_1 <= 0;
                Out_2 <= 0;
                counter <= 0;
            end
        end
    end
    function [N + 2:0] calcCorrelation;
        input [N - 1:0] data_in;
        reg [N + 2:0] sum;
        integer i;
        begin
            sum = 0;
            for(i = 0; i < N; i = i + 1)
            begin
                if(data_in[i] == Target_Num[i])
                begin
                    sum = sum + 8'b0000_0001;
                end
            end
            calcCorrelation = sum;
        end
    endfunction
    assign Correct_guess = (First_Num == Target_Num && Second_Num == Target_Num) ? 2'b11 : ((First_Num == Target_Num) ? 2'b01 : ((Second_Num == Target_Num) ? 2'b10 : 2'b00));
endmodule