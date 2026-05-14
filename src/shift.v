module shift (
    input [4:0] a,
    input [1:0] bshift,
    output [4:0] a_shifted
);

    assign a_shifted = a << bshift;
    
endmodule