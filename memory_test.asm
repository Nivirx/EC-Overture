#include "definitions.asm"
; testing memory functionality
prog:
    imm6 8      
    load r0, r3         ; aload copies the accumulator to "r6"
    aload

    imm6 42
    load r0, [r3]       ; after aload "r6" = r3 contains the address you want to write
.end:
.halt:
    halt