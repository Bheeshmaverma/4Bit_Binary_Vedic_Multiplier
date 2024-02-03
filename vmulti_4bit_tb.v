`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: 
// Name: Bheeshma Verma
// Create Date: 01.02.2024 18:10:31
// Design Name: 
// Module Name: vmulti_4bit_tb
// Project Name: Test bench for a 4 bit binary vedic multiplier
// Description: I have developed a source code (test bench) for the simulation of a 4 bit binary Vedic Multiplier in Verilog
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module vmulti_4bit_tb();
    reg [3:0]A,B;
    wire [7:0]P;
    wire CO;
    
    vmulti_4bit dut(.a(A),.b(B),.p(P),.co(CO));
    initial
        begin
            $monitor ($time, " A = %b, B = %b, P = %b, CO = %b", A, B ,P, CO);
        end
    initial 
        begin
        #5 A = 4'b0000; B = 4'b0001;
        #5 A = 4'b0001; B = 4'b0010;
        #5 A = 4'b1010; B = 4'b1010;
        #5 A = 4'b1111; B = 4'b1111;
        #10 $finish();
        end 

endmodule
