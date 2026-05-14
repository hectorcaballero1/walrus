module alu32_shift (
    input wire [31:0] a, b,
    input wire [4:0] bshift,
    input wire [1:0] alucontrol,
    output wire [31:0] result,
    output wire [3:0] aluflags
);

    wire [31:0] a_shifted;

    shift32 shifter (
        .a(a),
        .bshift(bshift),
        .a_shifted(a_shifted)
    );

    alu32 john (
        .a(a_shifted),
        .b(b),
        .ALUControl(alucontrol),
        .Result(result),
        .ALUFlags(aluflags)
    );

endmodule
