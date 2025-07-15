#include "../definitions.asm"
#bank program

prog:
    imm6 42
.result:
    out r0
    halt