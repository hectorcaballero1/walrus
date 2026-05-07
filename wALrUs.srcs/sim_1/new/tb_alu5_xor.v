`timescale 1ns / 1ns

module tb_alu5_xor();
    reg [4:0] a;
    reg [4:0] b;
    reg [2:0] alucontrol;
    wire [4:0] result;
    wire [3:0] aluflags;
    
    wire neg, zero, carry, overflow;
    assign {neg, zero, carry, overflow} = aluflags;

    alu5_xor test (
        .a(a), 
        .b(b), 
        .ALUControl(alucontrol), 
        .Result(result), 
        .ALUFlags(aluflags)
    );

    initial begin
        // 3 + 5
        a = 5'd3; b = 5'd5; alucontrol = 3'b000; #10;
        
        // 5 - 5
        a = 5'd5; b = 5'd5; alucontrol = 3'b001; #10;
        
        // 8 and 1
        a = 5'd8; b = 5'd1; alucontrol = 3'b010; #10;
        
        // 5 or 7
        a = 5'd5; b = 5'd7; alucontrol = 3'b011; #10;
        
        // 9 xor 6
        a = 5'd9; b = 5'd6; alucontrol = 3'b110; #10;
        
        $finish;
    end
    
endmodule