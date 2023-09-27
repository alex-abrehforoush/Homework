module Correlation_32 # (parameter N = 32)
(
    input [31:0] Num_1, Num_2, Num_3, Num_4, Num_5, Num_6, Num_7, Num_8, Num_9, Num_10, Num_11, Num_12, Num_13, Num_14, Num_15, Num_16, input [31:0] Target_Num, input Clock, Reset, output reg [3:0] Out_4
);
    reg [N + 2:0] max;
    integer j;
    integer k;
    always @(posedge Clock)
    begin
        max <= 0;
        if(calcCorrelation(Num_16) > max)
        begin
            k <= 16;
            max<=Num_16;
        end
        if(calcCorrelation(Num_15) > max)
        begin
            k <= 15;
            max<=Num_15;
        end
        if(calcCorrelation(Num_14) > max)
        begin
            k <= 14;
            max<=Num_14;
        end
        if(calcCorrelation(Num_13) > max)
        begin
            k <= 13;
            max<=Num_13;
        end
        if(calcCorrelation(Num_12) > max)
        begin
            k <= 12;
            max<=Num_12;
        end
        if(calcCorrelation(Num_11) > max)
        begin
            k <= 11;
            max<=Num_11;
        end
        if(calcCorrelation(Num_10) > max)
        begin
            k <= 10;
            max<=Num_10;
        end
        if(calcCorrelation(Num_9) > max)
        begin
            k <= 9;
            max<=Num_9;
        end
        if(calcCorrelation(Num_8) > max)
        begin
            k <= 8;
            max<=Num_8;
        end
        if(calcCorrelation(Num_7) > max)
        begin
            k <= 7;
            max<=Num_7;
        end
        if(calcCorrelation(Num_6) > max)
        begin
            k <= 6;
            max<=Num_6;
        end
        if(calcCorrelation(Num_5) > max)
        begin
            k <= 5;
            max<=Num_5;
        end
        if(calcCorrelation(Num_4) > max)
        begin
            k <= 4;
            max<=Num_4;
        end
        if(calcCorrelation(Num_3) > max)
        begin
            k <= 3;
            max<=Num_3;
        end
        if(calcCorrelation(Num_2) > max)
        begin
            k <= 2;
            max<=Num_2;
        end
        if(calcCorrelation(Num_1) > max)
        begin
            k <= 1;
            max<=Num_1;
        end
        Out_4 <= k;
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
                    sum = sum + 1;
                end
            end
            calcCorrelation = sum;
        end
    endfunction
endmodule