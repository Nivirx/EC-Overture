#include "../definitions.asm"
; 0 - turn left
; 1 - forward
; 2 - turn right
; 3 - wait
; 4 - action
; 5 - shoot
prog:
    imm6 2          ; turn right
    out r0

.check_wall:
    ; check if the input - 1 == 0, which means it is a wall on our right
    imm6 1              ; wall id
    load r0, r2
    in r1
    xor
    imm6 prog.left2     ; if there is a wall on our right turn left twice
    beqz
.check_empty:
    imm6 0              ; id for empty cell
    load r0, r2
    in r1
    xor
    imm6 prog.fwd       ; move into empty spaces
    beqz
.check_coin:
    imm6 8              ; id for coin
    load r0, r2
    in r1
    xor
    imm6 prog.fwd       ; move on top of coins
    beqz
.check_door:
    imm6 3              ; id for door
    load r0, r2
    in r1
    xor
    imm6 prog.action    ; if item is a door use action
    beqz

    imm6 prog
    ba                  ; if the space isn't empty, a wall, a coin, or a door, loop again
.fwd:
    imm6 1              ; fwd
    out r0
    imm6 prog
    ba
.left2:
    imm6 0              ; rotate left twice
    out r0
    out r0
    imm6 prog
    ba
.action:
    imm6 4              ; use cell in front of robot
    out r0

    imm6 prog
    ba
