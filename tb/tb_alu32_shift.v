`timescale 1ns / 1ns

module tb_alu32_shift();
    reg [31:0] a;
    reg [31:0] b;
    reg [4:0] bshift;
    reg [1:0] alucontrol;

    wire [31:0] result;
    wire [3:0] aluflags;

    wire neg, zero, carry, overflow;
    assign {neg, zero, carry, overflow} = aluflags;

    alu32_shift test (
        .a(a),
        .b(b),
        .bshift(bshift),
        .alucontrol(alucontrol),
        .result(result),
        .aluflags(aluflags)
    );

    initial begin
        // (1 << 2) + 3 = 7
        a = 32'd1; b = 32'd3; bshift = 5'd2; alucontrol = 2'b00; #10;

        // (8 << 1) - 8 = 8
        a = 32'd8; b = 32'd8; bshift = 5'd1; alucontrol = 2'b01; #10;

        // (3 << 1) & 6 = 6
        a = 32'd3; b = 32'd6; bshift = 5'd1; alucontrol = 2'b10; #10;

        // (1 << 3) | 2 = 10
        a = 32'd1; b = 32'd2; bshift = 5'd3; alucontrol = 2'b11; #10;

        // zero flag: (2 << 0) - 2 = 0
        a = 32'd2; b = 32'd2; bshift = 5'd0; alucontrol = 2'b01; #10;

        $finish;
    end

endmodule
