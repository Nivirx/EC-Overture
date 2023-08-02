#include "definitions.asm"
; spacial invasion level
; man this level is dumb...
; 0 - turn left
; 1 - forward
; 2 - turn right
; 3 - wait
; 4 - action
; 5 - shoot
prog:

    imm6 1      ; setup forward
    load r0, r4
    imm6 5      ; setup shoot
    load r0, r5
    imm6 3      ; setup wait
    load r0, r2
    out r5     ; shoot block in front of us and move into postition
    out r4     ; forward 1
    out r4     ; forward 2
    out r4     ; forward 3
    out r4     ; forward 4
    out r4     ; forward 5, setup complete time to start blast'n
.detect_loop:
    in r3
    imm6 prog.detect_none
    beqz        ; if input not eq to 0 (no item) then shoot, else wait
.detect_some:
    out r5      ; shoot and then branch to prog.result
    imm6 prog.result
    ba
.detect_none:
    out r2      ; else wait 1
.result:
    imm6 prog.detect_loop
    ba
.halt: