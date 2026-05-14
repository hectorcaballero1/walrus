`timescale 1ns / 1ns

module tb_alu32();
    reg [31:0] a;
    reg [31:0] b;
    reg [1:0] alucontrol;
    wire [31:0] result;
    wire [3:0] aluflags;
    
    // Desempaquetar las banderas para verlas mejor en el Waveform
    wire neg, zero, carry, overflow;
    assign {neg, zero, carry, overflow} = aluflags;

    alu32 test (
        .a(a), 
        .b(b), 
        .ALUControl(alucontrol), 
        .Result(result), 
        .ALUFlags(aluflags)
    );

    initial begin
        // 3 + 5
        a = 32'd3; 
        b = 32'd5; 
        alucontrol = 2'b00; // 00 para add
        #10;
        
        // Prueba 2: 5 - 5
        a = 32'd5; 
        b = 32'd5; 
        alucontrol = 2'b01; // 01 para subtract
        #10;
        
        // Prueba 3: 8 and 1
        a = 32'd8; 
        b = 32'd1; 
        alucontrol = 2'b10; // 10 para AND
        #10;
        
        // Prueba 4: 5 or 7
        a = 32'd5; 
        b = 32'd7; 
        alucontrol = 2'b11; // 11 para OR
        #10;
        
        $finish;
    end

endmodule