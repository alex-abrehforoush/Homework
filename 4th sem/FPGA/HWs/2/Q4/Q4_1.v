module Binary_Divisibility_By_7 (
    String, Clock, Reset, Remainder, Divisible
);
    input String, Clock, Reset;
    output [2:0]  Remainder;
    output Divisible;

    reg [2:0] temp_remainder;
    reg temp_divisible;

    assign Remainder = temp_remainder;
    assign Divisible = temp_divisible;

    initial begin
        temp_remainder <= 3'b000;
        temp_divisible <= 1'b0;
    end

    always @(posedge Clock) begin
        if (!Reset) begin
            temp_remainder = (temp_remainder * 2 + String) % 7;
            temp_divisible = !temp_remainder;
        end
        else begin
            temp_remainder <= 3'b000;
            temp_divisible <= 1'b1;
        end
    end


endmodule
