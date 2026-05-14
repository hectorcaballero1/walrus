# walrus

ALUs de 5 y 32 bits en Verilog, diseñadas para síntesis en la Basys3 (Artix-7).

### Módulos

| Módulo | Bits | Operaciones |
|---|---|---|
| alu5 | 5 | ADD, SUB, AND, OR |
| alu5_xor | 5 | ADD, SUB, AND, OR, XOR |
| alu5_xor_shift | 5 | igual que alu5_xor con shift previo sobre A |
| alu32 | 32 | ADD, SUB, AND, OR |

Todos los módulos exponen flags N, Z, C, V.

### Uso en la Basys3

top_alu5

| Switches | Señal |
|---|---|
| sw[4:0] | A |
| sw[9:5] | B |
| sw[15:14] | operación: 00=ADD, 01=SUB, 10=AND, 11=OR |

top_alu5_xor_shift

| Switches | Señal |
|---|---|
| sw[4:0] | A |
| sw[9:5] | B |
| sw[12:10] | operación: 000=ADD, 001=SUB, 010=AND, 011=OR, 110=XOR |
| sw[15:14] | shift sobre A |

En ambos: led[4:0] = resultado, led[15:12] = flags N,Z,C,V.
