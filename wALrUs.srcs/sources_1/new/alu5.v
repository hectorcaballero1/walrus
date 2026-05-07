module alu5(
    input [4:0] a, b,
    input [1:0] ALUControl,
    output reg [4:0] Result,
    output wire [3:0] ALUFlags
);

    wire neg, zero, carry, overflow;
    wire [4:0] condinvb;
    wire [5:0] sum;

    // add and subtract logic
    assign condinvb = ALUControl[0] ? ~b : b;
    assign sum = a + condinvb + ALUControl[0];

    always @(*)
    begin
        casex (ALUControl[1:0])
            2'b0?: Result = sum[4:0]; // 00: add, 01: subtract
            2'b10: Result = a & b;     // 10: AND
            2'b11: Result = a | b;     // 11: OR
        endcase
    end

    // flags
    assign neg = Result[4];
    assign zero = (Result == 5'b0);
    assign carry = (ALUControl[1] == 1'b0) & sum[5];
    assign overflow = (ALUControl[1] == 1'b0) & ~(a[4] ^ b[4] ^ ALUControl[0]) & (a[4] ^ sum[4]);
    
    assign ALUFlags = {neg, zero, carry, overflow};

endmodule