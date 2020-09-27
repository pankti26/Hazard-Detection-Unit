`timescale 1ns / 1ps

module hazard_detection_unit_tb(
    );
 
 reg [31:0] ins;
 reg [4:0] rd;
 reg memrd;
 wire control, PCWrite, IFIDWrite;
    
    hazard_detection_unit DUT(
        .ins(ins),
        .rd(rd),
        .memrd(memrd),
        .control(control),
        .PCWrite(PCWrite),
        .IFIDWrite(IFIDWrite)
        );
        
    initial begin
    //case1: load followed by add
    ins = 32'h30433;
    rd = 5'b00110;
    memrd = 1;
    #20
    //case2: store followed by add
    ins = 32'h30433;
    rd = 5'b00110;
    memrd = 0;
    #20
    //case3: load followed by add immediate
    ins = 32'h638413;
    rd = 5'b00110;
    memrd = 1;
    #20
    $finish;
    end
endmodule
