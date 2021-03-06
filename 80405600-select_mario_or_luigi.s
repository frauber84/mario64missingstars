;hook (replaces 'select file' print function)

.ORG 0x80174060 ; in ROM, 0x224520

JAL 0x80405600
ADDIU R0, R0, 0x0000

.ORG 0x80405600

ADDIU SP, SP, 0xFFE8 
SW RA, 0x0014 (SP)

; Display "Play as"

LUI A2, 0x8040 
ADDIU A2, A2, 0x5400 ; "Play as"
ADDIU A0, R0, 0x0070
JAL 0x802D66C0 
ADDIU A1, R0, 0x00BA

; Check for D-pad

LUI       T2, 0x8034
LB        T2, 0xAFA0 (T2)
ADDIU     T0, R0 ,0x0001   ; D-pad right = Mario
BEQ       T2, T0, SetMario
ADDIU R0, R0, 0x0000

ADDIU     T0, R0 ,0x0002   ; D-pad left = Luigi
BEQ       T2, T0, SetLuigi
ADDIU R0, R0, 0x0000

LUI AT, 0x8040
ORI AT, AT, 0x0001
LB AT, 0x0000 (AT) 

BNE R0, AT, Luigi
ADDIU R0, R0, 0x0000

Mario:
LUI A2, 0x8040 
ADDIU A2, A2, 0x5410   ; "Mario"
ADDIU A0, R0, 0x00C6
JAL 0x802D66C0       
ADDIU A1, R0, 0x00BA 
BEQ R0, R0, End
ADDIU R0, R0, 0x0000

Luigi:
LUI A2, 0x8040 
ADDIU A2, A2, 0x5420   ; "Luigi"
ADDIU A0, R0, 0x00C6
JAL 0x802D66C0
ADDIU A1, R0, 0x00BA
BEQ R0, R0, End
ADDIU R0, R0, 0x0000

SetMario:
LUI AT, 0x8040
ORI AT, AT, 0x0001
SB R0, 0x0000 (AT) ; Set mario

LUI A0, 0x160A
ORI A0, A0, 0x1B12 ; "MARI"
ADDIU A1, R0, 0x0018 ; "O"

LUI AT, 0x801A
ORI AT, AT, 0x7D98
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x801A
ORI AT, AT, 0x7DA0
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x801A
ORI AT, AT, 0x7DA8
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x801A
ORI AT, AT, 0x7DB0
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x801A
ORI AT, AT, 0x7EB0
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x801A
ORI AT, AT, 0x7F1C
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x8007
ORI AT, AT, 0x5E9C
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x8007
ORI AT, AT, 0x5FC8
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x8033
ORI AT, AT, 0x1648
LUI A1, 0x9E16
ORI A1, A1, 0x0A1B
SW A1, 0x0000 (AT)

LUI A1, 0x1218
ORI A1, A1, 0xFF00
SW A1, 0x0004 (AT)

LUI AT, 0x801C
ORI AT, AT, 0xFE04   ; sequence table first entry
LUI A1, 0x007B
ORI A1, A1, 0x0980   ; Mario Sounds
SW A1, 0x0000 (AT)


BEQ R0, R0, Mario
ADDIU R0, R0, 0x0000

SetLuigi:
LUI AT, 0x8040
ORI AT, AT, 0x0001
ADDIU A2, R0, 0x0001
SB A2, 0x0000 (AT)

LUI A0, 0x151E
ORI A0, A0, 0x1210      ; "LUIG" (text patches)
ADDIU A1, R0, 0x0012    ; "I"

LUI AT, 0x801A
ORI AT, AT, 0x7D98
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x801A
ORI AT, AT, 0x7DA0
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x801A
ORI AT, AT, 0x7DA8
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x801A
ORI AT, AT, 0x7DB0
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x801A
ORI AT, AT, 0x7EB0
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x801A
ORI AT, AT, 0x7F1C
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x8007
ORI AT, AT, 0x5E9C
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x8007
ORI AT, AT, 0x5FC8
SW A0, 0x0000 (AT)
SB A1, 0x0004 (AT)

LUI AT, 0x8033
ORI AT, AT, 0x1648
LUI A1, 0x9E15
ORI A1, A1, 0x1E12
SW A1, 0x0000 (AT)

LUI A1, 0x1012
ORI A1, A1, 0xFF00
SW A1, 0x0004 (AT)

LUI AT, 0x801C
ORI AT, AT, 0xFE04   ; sequence table first entry
LUI A1, 0x007D
ORI A1, A1, 0x6AB0   ; Luigi Sounds
SW A1, 0x0000 (AT)


BEQ R0, R0, Luigi
ADDIU R0, R0, 0x0000


End:
LW RA, 0x0014 (SP)
JR RA
ADDIU SP, SP, 0x0018

