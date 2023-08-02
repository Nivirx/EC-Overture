#include "../definitions.asm"

prog:
    imm6 0b000011
    load r0, r2
    in r1
    and
    out r3
.result:
.halt: