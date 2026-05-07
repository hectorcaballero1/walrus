module alu5_xor_shift(
    input wire [4:0] a, b,
    input wire [1:0] bshift,
    input wire [2:0] alucontrol,
    output wire [4:0] result,
    output wire [3:0] aluflags
    );
    
    wire [4:0] a_desplazado;
    
    shift shifter(
        .a(a), 
        .bshift(bshift), 
        .a_shifted(a_desplazado)
    );
    
    alu5_xor john (
        .a(a_desplazado), 
        .b(b), 
        .ALUControl(alucontrol), 
        .Result(result), 
        .ALUFlags(aluflags)
    );
    
endmodule
