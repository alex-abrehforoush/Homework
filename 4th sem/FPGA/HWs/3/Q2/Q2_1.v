//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:36:16 05/18/2021 
// Design Name: 
// Module Name:    Q2_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module m_counter (
    Count_m, Pulse1000, Pulse2000, Pulse5000, Clock, Reset, Out, c_1000, c_2000, c_5000
);
    input [18:0] Count_m;
    input Pulse1000, Pulse2000, Pulse5000, Clock, Reset;
    output Out;
    output [8:0] c_1000;
    output [7:0] c_2000;
    output [6:0] c_5000;
    
    reg temp_pulse1000;
    reg temp_pulse2000;
    reg temp_pulse5000;

    reg [8:0] temp_c_1000;
    reg [7:0] temp_c_2000;
    reg [6:0] temp_c_5000;
    reg temp_Out;

    initial begin
        temp_c_1000 <= 0;
        temp_c_2000 <= 0;
        temp_c_5000 <= 0;
    end

    assign c_1000 = temp_c_1000;
    assign c_2000 = temp_c_2000;
    assign c_5000 = temp_c_5000;
    assign Out = Count_m <= (c_1000 * 12'b0011_1110_1000 + c_2000 * 13'b0_0111_1101_0000 + c_5000 * 13'b1_0011_1000_1000);
    
    always @(posedge Clock) begin
        if (!Reset) begin
            temp_pulse1000 <= 1'b0;
            temp_pulse2000 <= 1'b0;
            temp_pulse5000 <= 1'b0;
            temp_c_1000 <= 9'b0_0000_0000;
            temp_c_2000 <= 8'b0000_0000;
            temp_c_5000 <= 7'b000_0000;
        end
        else begin
            temp_pulse1000 <= Pulse1000;
            temp_pulse2000 <= Pulse2000;
            temp_pulse5000 <= Pulse5000;
            if (temp_pulse1000 == 0 && Pulse1000 == 1) begin
                temp_c_1000 <= temp_c_1000 + 9'b1;
            end
            if (temp_pulse2000 == 0 && Pulse2000 == 1) begin
                temp_c_2000 <= temp_c_2000 + 8'b1;
            end
            if (temp_pulse5000 == 0 && Pulse5000 == 1) begin
                temp_c_5000 <= temp_c_5000 + 7'b1;
            end
        end
    end

endmodule
