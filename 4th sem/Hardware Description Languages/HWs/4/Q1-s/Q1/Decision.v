module Decision
(
    input clk, Reset, input [1:0] Correct_guess, In_wr, output reg [1:0] Result
);
    reg [3:0] counter = 0;
    always @(posedge clk or posedge Reset)
    begin
        if(Reset)
        begin
            Result <= 0;
            counter <= 0;
        end
        else
        begin
            if(counter < 8)
            begin
                if(Correct_guess == 2'b00)
                begin
                    Result <= 0;
                    counter <= counter + 4'b0001;
                end
                else
                begin
                    Result <= Correct_guess;
                    counter <= 0;
                end
            end
            else
            begin
                if(Correct_guess != 0)
                begin
                    Result <= Correct_guess;
                end
                else
                begin
                    Result <= In_wr;
                end
                counter <= 0;
            end
        end
    end
endmodule

