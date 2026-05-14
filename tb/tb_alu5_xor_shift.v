`timescale 1ns / 1ns

module tb_alu5_xor_shift();
    reg [4:0] a;
    reg [4:0] b;
    reg [1:0] bshift;
    reg [2:0] alucontrol;
    
    wire [4:0] result;
    wire [3:0] aluflags;

    alu5_xor_shift test (
        .a(a), 
        .b(b), 
        .bshift(bshift),
        .alucontrol(alucontrol), 
        .result(result), 
        .aluflags(aluflags)
    );

    initial begin 
        b = 5'b00000; // b = 0
        alucontrol = 3'b000; // suma
        a = 5'b00011; 
    
        bshift = 2'b00; #10; // sin shift
       
        bshift = 2'b01; #10; // shift 1 posicion
        
        bshift = 2'b10; #10; // shift 2 posiciones
        
        bshift = 2'b11; #10; // shift 3 posiciones
        
        $finish;
    end
endmodule
