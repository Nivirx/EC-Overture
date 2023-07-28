#include "definitions.asm"
; testing memory functionality
prog:
    imm6 32
    load r0, r5         ; count

    imm6 0
    load r0, r3         ; start address (by preloading accumulator)
    aload               ; setup counter for later and skip using the ALU for now, just move to 8

    imm6 1              ; stride
    load r0, r2

    imm6 0
    load r0, r1
    load r0, r4         ; current

    imm6 prog.save
    ba
.save_loop:
    load r4, r1
.save:
    imm6 1
    load r0, r2         ; stride

    imm6 42             ; value to save
    out r0              ; after aload "r6" = r3 contains the address you want to write
    add                 ; r1 (count) - r2 (stride)
    load r3, r4         ; save count

    imm6 prog.end       ; check if we have reached the end of the write operation
    load r5, r1
    load r4, r2
    sub
    beqz                ; if count - current == 0, branch r0 (prog.end)

    load r4, r3         ; restore result from count
    aload               ; else, load result to address register 
    imm6 prog.save_loop
    ba                  ; and loop
.end:
.halt:
    halt