module alu32(
    input wire [31:0] a, b,
    input wire [1:0] ALUControl,
    output reg [31:0] Result,
    output wire [3:0] ALUFlags
);

    wire neg, zero, carry, overflow;
    wire [31:0] condinvb;
    wire [32:0] sum;

    // add and subtract logic
    assign condinvb = ALUControl[0] ? ~b : b;
    assign sum = a + condinvb + ALUControl[0];

    always @(*)
    begin
        casex (ALUControl[1:0])
            2'b0?: Result = sum[31:0]; // 00: add, 01: subtract
            2'b10: Result = a & b;     // 10: AND
            2'b11: Result = a | b;     // 11: OR
        endcase
    end

    // flags
    assign neg = Result[31];
    assign zero = (Result == 32'b0);
    assign carry = (ALUControl[1] == 1'b0) & sum[32];
    assign overflow = (ALUControl[1] == 1'b0) & ~(a[31] ^ b[31] ^ ALUControl[0]) & (a[31] ^ sum[31]);
    
    assign ALUFlags = {neg, zero, carry, overflow};

endmodule