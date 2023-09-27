module sequence_detector (
    input_seq, clk, reset, lookfor_seq, seq_detected, dseq_count, str//////////
);
    input input_seq;
    input clk;
    input reset;
    input [1:0] lookfor_seq;
    output seq_detected;
    output [15:0] dseq_count;
    output [4:0] str;/////////////

    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;
    parameter s3 = 2'b11;

    reg [4:0] str;
    reg temp_seq_detected;
    assign seq_detected = temp_seq_detected;
    reg [15:0] temp_dseq_count;
    assign dseq_count = temp_dseq_count;
    always @(negedge clk) begin
        temp_seq_detected <= 1'b0;
        str[0] = str[1];
        str[1] = str[2];
        str[2] = str[3];
        str[3] = str[4];
        str[4] = input_seq;
        if (lookfor_seq == s0) begin
            if (str == 5'b10111) begin
                temp_seq_detected <= 1'b1;
                temp_dseq_count <= temp_dseq_count + 1;
            end
        end
        else if (lookfor_seq == s1) begin
            if (str == 5'b01010) begin
                temp_seq_detected <= 1'b1;
                temp_dseq_count <= temp_dseq_count + 1;
            end
        end
        else if (lookfor_seq == s2) begin
            if (str == 5'b10101) begin
                temp_seq_detected <= 1'b1;
                temp_dseq_count <= temp_dseq_count + 1;
            end
        end
        else if (lookfor_seq == s3) begin
            if (str == 5'b10100) begin
                temp_seq_detected <= 1'b1;
                temp_dseq_count <= temp_dseq_count + 1;
            end
        end
    end
    always @(lookfor_seq) begin
        temp_dseq_count <= 16'b0000_0000_0000_0000;
    end
endmodule
