`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:21:12 05/19/2021
// Design Name:   Q3_1
// Module Name:   C:/Users/Alireza/Desktop/Programming/Verilog-Digital-System-Design/HWs/Hw3_9816603/Q3/TestQ3_1.v
// Project Name:  Q3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Q3_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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
