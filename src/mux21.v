module mux21 (
    input wire a, b, sel,
    output wire y
);
    assign y = (sel & a) | (~sel & b);

endmodule
