#include "definitions.asm"
;
; Solution to Storage Cracker level on TC
; Output is the guess to 'crack the code'
; Input is 1 if the guess was too high and 0 if low
;
; Uses r0, r1, r2, r5
; Unused r4
prog:
    imm6 1
    load r0, r1
    load r0, r2
    ror                 ; make a 0b1000_0000 from 0b00000001 ROR 1
                        ; 128 in r3
    load r3, r5         ; save as starting point
.loop_1:
    out r3
    in r3

    imm6 prog.low       ; if input is 1 the code is a higher number, if 0 its lower
    beqz                ; branch if r3 == 0 

    load r5, r1         ; saved value of previous loop/or starting point
    imm6 1              ; step size
    load r0, r2     
.high:
    sub                 ; current - 1 = next guess
    load r3, r5
    imm6 prog.result    ; jump over low
    ba
.low:
    add                 ; current + 1 = next guess
    load r3, r5         ; save for next round
.result:
    imm6 prog.loop_1    ; branch back to the start
    ba
.halt:
    halt