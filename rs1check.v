`timescale 1ns / 1ps

module check1(
    input [6:0] op,
    output rs1
    );
    assign rs1 = ((op[6] & (~op[3])) | (~op[2]));
endmodule

module rs1check(
    input [6:0] op,
    input [4:0] rs1,
    input [4:0] rd,
    output o
    );
    wire w1,w2;
    check1 c1(op, w1);
    assign w2 = ~(rs1^rd);
    assign o = w1 & w2;
endmodule
