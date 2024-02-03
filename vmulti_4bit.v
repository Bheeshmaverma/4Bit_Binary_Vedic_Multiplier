`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: 
// Name: Bheeshma Verma
// Create Date: 01.02.2024 17:34:42
// Design Name: 
// Module Name: vmulti_4bit
// Project Name: 4 Bit Binary Vedic Multiplier 
// Description: I have developed a source code for the designing of a 4 bit binary Vedic Multiplier in Verilog
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Top module for 4 bit binary vedic multiplier
module vmulti_4bit(
    input [3:0]a,b,
    output [7:0]p,
    output co );
    wire [15:0]s;
    wire [3:0]t0,t1,c;
    
    vmulti_2bit 
    m0(a[1:0],b[1:0],s[3:0]),
    m1(a[3:2],b[1:0],s[7:4]),
    m2(a[1:0],b[3:2],s[11:8]),
    m3(a[3:2],b[3:2],s[15:12]);
    
    assign p[0] = s[0],
           p[1] = s[1];
    assign t0[1:0] = s[3:2],
           t0[3:2] = s[13:12];
           
    rca_4bit a0(s[7:4],s[11:8],t1[3:0],c[0]),
             a1(t0[3:0],t1[3:0],p[5:2],c[1]);
    
    half_adder ha0(c[0],c[1],c[2],c[3]);
    rca_2bit a2(c[3:2],s[15:14],p[7:6],co);
    
endmodule

// Top module for 2 bit binary multiplier
module vmulti_2bit(
    input [1:0] a,b,
    output [3:0]p);
    wire [3:0]t;
    and g0(p[0],a[0],b[0]);
    
    and g1(t[0],a[1],b[0]);
    and g2(t[1],a[0],b[1]);
    half_adder ha0(t[0],t[1],p[1],t[2]);
    
    and g3(t[3],a[1],b[1]);
    half_adder ha1(t[2],t[3],p[2],p[3]);
endmodule

//4 bit ripple carry adder module
module rca_4bit(
    input [3:0]a,b,
    output [3:0]sum,
    output cout);
     wire [2:0]c;
     half_adder ha0(a[0],b[0],sum[0],c[0]);
     full_adder 
         fa0(a[1],b[1],c[0],sum[1],c[1]),
         fa1(a[2],b[2],c[1],sum[2],c[2]),
         fa2(a[3],b[3],c[2],sum[3],cout);
endmodule

//2 bit ripple carry adder
module rca_2bit(
    input [1:0]a,b,
    output [1:0]s,
    output co);
    wire t0;
    half_adder ha0(a[0],b[0],s[0],t0);
    full_adder fa0(a[1],b[1],t0,s[1],co);
endmodule

//full adder module
module full_adder(
    input a,b,cin,
    output sum,cout);
    wire t0,t1,t2;
    half_adder ha0(a,b,t0,t1),
    ha1(t0,cin,sum,t2);
    assign cout = t1 | t2;
endmodule

//half adder module
module half_adder(
    input a,b,
    output sum,cout );
    assign sum = a ^ b;
    assign cout = a & b; 
endmodule









