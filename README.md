# walrus

ALUs de 5 y 32 bits en Verilog, diseñadas para síntesis en la Basys3 (Artix-7).

Módulos: alu5 (ADD, SUB, AND, OR), alu5_xor (+ XOR), alu5_xor_shift (+ shift previo sobre A), alu32 (ADD, SUB, AND, OR, 32 bits). Todos exponen flags N, Z, C, V.

Los top-level usan los 16 switches de la Basys3: sw[4:0] = A, sw[9:5] = B, sw[12:10] = operación, sw[15:14] = shift. El resultado sale en led[4:0] y los flags en led[15:12].
