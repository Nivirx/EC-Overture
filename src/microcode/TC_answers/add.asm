#include "definitions.asm"
; program adds 5 to the input and puts
; the sum on the output, no carry
prog:
    imm6 0            ; start at 0
    load r0, r1
    imm6 prog.add    ; load address to add5 and branch
    ba
.add:    
    imm6 0x01           ; edit this imm value to change count-by value
    load r0, r2
    add                 ; r1 + 0x05 = r3
    load r3, r4         ; save result in r4
    load r3, r2         
    imm6 0x32
    load r0, r1
    sub                 ; 50 - result = r3
    imm6 prog.result
    beqz                ; PC = R0 if R3 = 0
    load r4, r1         ; add5(result)
    imm6 prog.add
    ba
.result:
    out r4
.hcf:
    hcf