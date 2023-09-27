module testSequence_detector (
    
);
    reg input_seq;
    reg clk;
    reg reset;
    reg [1:0] lookfor_seq;
    wire seq_detected;
    wire [15:0] dseq_count;
    wire [4:0] str;//////////////
    sequence_detector tester(.input_seq(input_seq), .clk(clk), .reset(reset), .lookfor_seq(lookfor_seq), .seq_detected(seq_detected), .dseq_count(dseq_count), .str(str));

	initial begin
        clk = 1;
        repeat(200) begin
            #5 clk = ~clk;
        end
    end
    initial
		begin
			$monitor("%d	@str = %b@ input_seq = %b, clk = %b, reset = %b, lookfor_seq = %b, seq_detected = %b, dseq_count = %b", $time, str, input_seq, clk, reset, lookfor_seq, seq_detected, dseq_count);
            
            input_seq = 0;
            lookfor_seq = 2'b00;
            reset=0;
            
            #5
            input_seq = 0;
            lookfor_seq = 2'b00;
            reset=0;

            #10
            input_seq = 0;
            lookfor_seq = 2'b00;
            reset = 0;


            #10
            input_seq = 1;
            lookfor_seq = 2'b00;
            reset = 0;


            #10
            input_seq = 0;
            lookfor_seq = 2'b00;
            reset = 0;


            #10
            input_seq = 1;
            lookfor_seq = 2'b00;
            reset = 0;

            #10
            input_seq = 1;
            lookfor_seq = 2'b00;
            reset = 0;

            #10
            input_seq = 1;
            lookfor_seq = 2'b00;
            reset = 0;

            #10
            input_seq = 0;
            lookfor_seq = 2'b00;
            reset = 0;

            #10
            input_seq = 1;
            lookfor_seq = 2'b00;
            reset = 0;

            #10
            input_seq = 0;
            lookfor_seq = 2'b00;
            reset = 0;

            #10
            input_seq = 1;
            lookfor_seq = 2'b00;
            reset = 0;

            #10
            input_seq = 1;
            lookfor_seq = 2'b00;
            reset = 0;

            #10
            input_seq = 1;
            lookfor_seq = 2'b00;
            reset = 0;

            #10
            input_seq = 0;
            lookfor_seq = 2'b00;
            reset = 0;

            #10
            input_seq = 1;
            lookfor_seq = 2'b00;
            reset = 0;

            #10
            input_seq = 1;
            lookfor_seq = 2'b00;
            reset = 0;

            #10
            input_seq = 1;
            lookfor_seq = 2'b00;
            reset = 0;
		end
endmodule
