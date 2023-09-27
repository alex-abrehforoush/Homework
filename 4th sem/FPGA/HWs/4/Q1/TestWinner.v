module testWinner # (parameter N = 8)
(
    
);
    reg [N + 2:0] In_1, In_2;
    wire [1:0] Out_wr;

    Winner w(In_1, In_2, Out_wr);
    initial
		begin
            $monitor("%d	In_1 = %b, In_2 = %b, Out_wr = %b", $time, In_1, In_2, Out_wr);
            
            #10
            In_1 = 11'b000_0111_1100;
            In_2 = 11'b000_0000_1111;

            #10
            In_1 = 11'b000_0000_1100;
            In_2 = 11'b000_1111_1111;

            #10
            In_1 = 11'b000_0000_1100;
            In_2 = 11'b000_0000_1100;
		end
endmodule
