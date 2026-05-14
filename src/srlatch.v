module srlatch (
    input wire s, r,
    output reg q, qn
);
    always @(*)
        casex ({s, r})
            2'b10: begin q = 1'b1; qn = 1'b0; end
            2'b01: begin q = 1'b0; qn = 1'b1; end
            2'b00: begin q = q;    qn = qn;   end
            2'b11: begin q = 1'bx; qn = 1'bx; end
        endcase

endmodule
