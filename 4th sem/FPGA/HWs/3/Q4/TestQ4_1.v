`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:36:44 05/19/2021
// Design Name:   Q4_1
// Module Name:   C:/Users/Alireza/Desktop/Programming/Verilog-Digital-System-Design/HWs/Hw3_9816603/Q4/TestQ4_1.v
// Project Name:  Q4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Q4_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testBinary_Divisibility_By_7 (
    
);
    reg String, Clock, Reset;
    wire [2:0]  Remainder;
    wire Divisible;

    Binary_Divisibility_By_7 tester(.String(String), .Clock(Clock), .Reset(Reset), .Remainder(Remainder), .Divisible(Divisible));

	initial begin
        Clock = 0;
        repeat(200) begin
            #5 Clock = ~Clock;
        end
    end
    initial
		begin
            $monitor("%d	String = %b, Clock = %b, Reset = %b, Remainder = %b, Divisible = %b", $time, String, Clock, Reset, Remainder, Divisible);
            String = 0;
            Reset = 0;
            
            #10
            String = 0;
            Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 1;
            Reset = 0;
            #10
            String = 1;
            Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 1;
            Reset = 0;
            #10
            String = 1;
            Reset = 0;
            #10
            String = 1;
			Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 0;
            Reset = 0;
            #10
            String = 0;
            Reset = 1;
            #10
            String = 1;
            Reset = 0;
            #10
            String = 1;
            Reset = 1;
            #10
            String = 0;
            Reset = 1;
            #10
            String = 1;
            Reset = 1;
            #10
            String = 1;
            Reset = 0;
            #10
            String = 1;
			Reset = 0;
		end
endmodule

