module shift32 (
    input [31:0] a,
    input [4:0] bshift,
    output [31:0] a_shifted
);

    assign a_shifted = a << bshift;

endmodule
