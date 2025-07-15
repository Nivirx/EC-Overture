#include "definitions.asm"
; space laser program for TC
prog:
    imm6 6
    load r0, r2
    in r1
    mul
    out r3
.result:
.halt:
    halt