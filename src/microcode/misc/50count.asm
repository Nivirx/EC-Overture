#include "../definitions.asm"
#bank program

prog:
    imm6 0x0
    load r0, r1         ; init r1 to 0

.loop:
    imm6 0x1
    load r0, r2         ; value to increment by

    ; r1+r2=r3
    add                 ; add r1 + value
    load r3, r2         ; store result in r2

    imm6 0x32
    load r0, r1         
    sub                 ; 50 - r2 = remainder

    ; r3 (C) holds the difference between 50 and our result

    imm6 prog.result
    beqz                ; if r3 == 0 branch to [r0]

    load r2, r1         
    imm6 prog.loop
    ba                  ; else, copy result to r1 and loop

.result:
    out r2
    halt