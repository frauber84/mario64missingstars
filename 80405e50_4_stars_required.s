;  Deactive if Stars > 4


.ORG 0x80405e50

ADDIU SP, SP, 0xFFE8 
SW RA, 0x0014 (SP)

LUI V0, 0x8034
LH V0, 0xB21A (V0)

SLTIU V0, V0, 0x0004

BEQ V0, R0, Deactivate
ADDIU R0, R0, 0x0000

End:
LW RA, 0x0014 (SP)
JR RA
ADDIU SP, SP, 0x0018


Deactivate:
LUI A0, 0x8036
LW A0, 0x1160 (A0)
JAL 0x802a0568   ; Deactive object
ADDIU R0, R0, 0x0000

BEQ R0, R0, End
ADDIU R0, R0, 0x0000

