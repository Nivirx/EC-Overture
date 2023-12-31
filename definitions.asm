; see https://github.com/hlorenzi/customasm for documentation

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

#ruledef
{
    imm6 {value}                                => 0b00 @ value`6
    load r{src: register}, r{dst: register}     => 0b10 @ src`3 @ dst`3
    aload                                       => 0b10 @ 0b110 @ 0b110
    in r{r: register}                           => 0b10 @ 0b110 @ r
    out r{r: register}                          => 0b10 @ r @ 0b110
}    

#ruledef
{
    or              => 0b01 @ 0b000 @ 0b000
    nand            => 0b01 @ 0b000 @ 0b001
    nor             => 0b01 @ 0b000 @ 0b010
    and             => 0b01 @ 0b000 @ 0b011
    xnor            => 0b01 @ 0b000 @ 0b100
    xor             => 0b01 @ 0b000 @ 0b101
    not             => 0b01 @ 0b000 @ 0b110
    ALU_EXT0_RES7   => 0b01 @ 0b000 @ 0b111
    ashr            => 0b01 @ 0b001 @ 0b000
    div             => 0b01 @ 0b001 @ 0b001
    mul             => 0b01 @ 0b001 @ 0b010
    sub             => 0b01 @ 0b001 @ 0b011
    add             => 0b01 @ 0b001 @ 0b100
    ALU_EXT1_RES5   => 0b01 @ 0b001 @ 0b101
    ALU_EXT1_RES6   => 0b01 @ 0b001 @ 0b110
    ALU_EXT1_RES7   => 0b01 @ 0b001 @ 0b111
    rol             => 0b01 @ 0b010 @ 0b000
    ror             => 0b01 @ 0b010 @ 0b001
    shr             => 0b10 @ 0b010 @ 0b010
    shl             => 0b10 @ 0b010 @ 0b011
    neg             => 0b10 @ 0b010 @ 0b100
    ALU_EXT2_RES5   => 0b10 @ 0b010 @ 0b101
    ALU_EXT2_RES6   => 0b10 @ 0b010 @ 0b110
    ALU_EXT2_RES7   => 0b10 @ 0b010 @ 0b111
    ; and so on...
    ALU_EXT7_RES1   => 0b01 @ 0b111 @ 0b000
}

; conditional jump block
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

; halt encodings
#ruledef
{
    hcf     => 0b10 @ 0b111 @ 0b111
    halt    => 0b10 @ 0b111 @ 0b111
}
