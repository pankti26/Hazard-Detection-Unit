`timescale 1ns / 1ps

module check2(
    input [6:0] op,
    output rs2
    );
    assign rs2 = (~op[2])&(op[5])&((~op[6]) | (~op[4]));
endmodule

module rs2check(
    input [6:0] op,
    input [4:0] rs2,
    input [4:0] rd,
    output o
    );
    wire w1,w2;
    check2 c2(op, w1);
    assign w2 = ~(rs2^rd);
    assign o = w1 & w2;
endmodule
