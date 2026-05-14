module top_alu5_xor_shift(
    input [15:0] sw,
    output [15:0] led
);

    wire [4:0] alu_result;
    wire [3:0] alu_flags;

    alu5_xor_shift john (
        .a(sw[4:0]),
        .b(sw[9:5]),
        .bshift(sw[15:14]),
        .alucontrol(sw[12:10]),
        .result(alu_result),
        .aluflags(alu_flags)
    );

    assign led[4:0] = alu_result;
    assign led[11:5] = 7'b0000000;  // why not
    assign led[15:12] = alu_flags;

endmodule