module tff (
    input wire clk, rst, t,
    output reg q
);
    always @(posedge clk or posedge rst)
        if (rst) q <= 1'b0;
        else     q <= t ? ~q : q;

endmodule
