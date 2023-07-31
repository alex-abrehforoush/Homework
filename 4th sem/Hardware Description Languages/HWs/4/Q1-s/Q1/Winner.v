module Winner # (parameter N = 8)
(
    input [N + 2:0] In_1, In_2, output [1:0] Out_wr
);
    assign Out_wr = (In_1 > In_2) ? 2'b01 : ((In_1 < In_2) ? 2'b10 : 2'b11);
endmodule