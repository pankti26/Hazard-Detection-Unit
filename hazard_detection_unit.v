`timescale 1ns / 1ps

module hazard_detection_unit(
    input [31:0] ins,
    input [4:0] rd,
    input memrd,
    output control,
    output PCWrite,
    output IFIDWrite
    );
    wire w1, w2, w3, out;
    rs2check r2(ins[6:0], ins[24:20], rd, w2);
    rs1check r1(ins[6:0], ins[19:15], rd, w1);
    assign w3 = w1 | w2;
    assign out = w3 & memrd;
    assign control = out;
    assign PCWrite = ~out;
    assign IFIDWrite = ~out;
endmodule