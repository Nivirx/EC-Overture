; see https://github.com/hlorenzi/customasm for documentation regarding customasm

; ECP8 is a 8-bit Turring complete CPU for the game 'Turring Complete'
; - Instructions are fixed width 8-bit instructions
; - Can directly load into r0 up to a 6-bit constant
; - ALU with integer add/sub/mul & arithmetic/logical shift operations (div disabled)
; 
;
; # Registers
; - r0 is a scratch register
; - r1,2 are used as the input to the ALU (A & B)
; - r3,r4 are used as the output from the ALU (C & sometimes D)
; - r5 is also a scratch register in practice
;
; # Instruction space layout
; - encodings begining with 0b00 are immediate value loads
; - encodings with 0b01 are ALU operations and are encoded as 0b01:EXT:FUNCTION
; - encodings begining with 0b10 are register and bus i/o functions
; - encodings beinging with 0b11 are for conditional checks versus the contents of the r3 register
;   the r0 register holds the location of the location.
;
; As a consequence jumping to an immediate requires 2 clock's (1 for the imm6 and then the branch check)

#bankdef program
{
    #bits 8
    #addr 0x00
    #size 0xFF
    #outp 0x00
}

#subruledef register
{
    0      => 0b000
    1      => 0b001
    2      => 0b010
    3      => 0b011
    4      => 0b100
    5      => 0b101
}

; immediate load encodings
#ruledef
{
    imm6 {value}                                => 0b00 @ value`6
}    

; register and bus i/o encodings
#ruledef
{
    load r{src: register}, r{dst: register}     => 0b10 @ src`3 @ dst`3
    aload                                       => 0b10 @ 0b110 @ 0b110
    in r{r: register}                           => 0b10 @ 0b110 @ r`3
    out r{r: register}                          => 0b10 @ r`3 @ 0b110
}

; EXT0 functions
#ruledef
{
    or              => 0b01 @ 0b000 @ 0b000
    nand            => 0b01 @ 0b000 @ 0b001
    nor             => 0b01 @ 0b000 @ 0b010
    and             => 0b01 @ 0b000 @ 0b011
    xnor            => 0b01 @ 0b000 @ 0b100
    xor             => 0b01 @ 0b000 @ 0b101
    not             => 0b01 @ 0b000 @ 0b110
    ;ALU_EXT0_RES7   => 0b01 @ 0b000 @ 0b111
}

; EXT1 functions
#ruledef
{ 
    ashr            => 0b01 @ 0b001 @ 0b000
    div             => 0b01 @ 0b001 @ 0b001
    mul             => 0b01 @ 0b001 @ 0b010
    sub             => 0b01 @ 0b001 @ 0b011
    add             => 0b01 @ 0b001 @ 0b100
    ;ALU_EXT1_RES5   => 0b01 @ 0b001 @ 0b101
    ;ALU_EXT1_RES6   => 0b01 @ 0b001 @ 0b110
    ;ALU_EXT1_RES7   => 0b01 @ 0b001 @ 0b111
}

; EXT2 functions
#ruledef
{
    rol             => 0b01 @ 0b010 @ 0b000
    ror             => 0b01 @ 0b010 @ 0b001
    shr             => 0b01 @ 0b010 @ 0b010
    shl             => 0b01 @ 0b010 @ 0b011
    neg             => 0b01 @ 0b010 @ 0b100
    ;ALU_EXT2_RES5   => 0b01 @ 0b010 @ 0b101
    ;ALU_EXT2_RES6   => 0b01 @ 0b010 @ 0b110
    ;ALU_EXT2_RES7   => 0b01 @ 0b010 @ 0b111
}

; and so on...currently everything above EXT2 is unimplemented and left floating, and should just be no-op (untested)

; conditional block encodings
#ruledef
{
    bn      => 0b11 @ 0b000 @ 0b000
    beqz    => 0b11 @ 0b000 @ 0b001
    bltz    => 0b11 @ 0b000 @ 0b010
    blez    => 0b11 @ 0b000 @ 0b011
    ba      => 0b11 @ 0b000 @ 0b100
    bnez    => 0b11 @ 0b000 @ 0b101
    bgez    => 0b11 @ 0b000 @ 0b110
    bgtz    => 0b11 @ 0b000 @ 0b111
}

; halt encoding(s)
#ruledef
{
    halt    => 0b10 @ 0b111 @ 0b111
}
