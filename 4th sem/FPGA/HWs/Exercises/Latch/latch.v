`timescale 1ns/100ps
module latch (input s, r, output q, q_b);
    nor # (4)
        g1(q_b, s, q),
        g2(q, r, q_b);
endmodule