module top_alu5 (
    input [15:0] sw,
    output [15:0] led
);
    
    wire [4:0] alu_result;
    wire [3:0] alu_flags;

    alu5 john (
        .a(sw[4:0]),
        .b(sw[9:5]),
        .ALUControl(sw[15:14]),
        .Result(alu_result),
        .ALUFlags(alu_flags)
    );

    assign led[4:0] = alu_result;   
    assign led[11:5] = 7'b0000000;  // why not
    assign led[15:12] = alu_flags;  
    
endmodule
