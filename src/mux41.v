module mux41 (
    input wire a, b, c, d,
    input wire [1:0] sel,
    output reg y
);
    always @(*)
        case (sel)
            2'b00: y = a;
            2'b01: y = b;
            2'b10: y = c;
            2'b11: y = d;
        endcase

endmodule
