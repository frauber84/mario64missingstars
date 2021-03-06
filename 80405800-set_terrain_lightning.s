;  Sets terrain RGB according to time of the day by patching the polygon colors of flatworld

ADDIU SP, SP, 0xFFE8 
SW RA, 0x0014 (SP)

LUI T5, 0x8040
ORI T5, T5, 0x0004
LB T5, 0x0000 (T5)    ;   current day-night counter

SLTIU T5, T5, 0x0009
BEQ T5, R0, NightTerrain

DayTerrain:

LUI A0, 0x0B00
JAL 0x80277F50
ORI A0, A0, 0x0000

LUI T5, 0x0000
ORI T5, T5, 0x1010
SW T5, 0x0000 (V0)

LUI T5, 0xFFFF
ORI T5, T5, 0xFFFF
SW T5, 0x0004 (V0)

LUI T5, 0x4C4C
ORI T5, T5, 0x4C00
SW T5, 0x0020 (V0)

LUI T5, 0x9999
ORI T5, T5, 0x9900
SW T5, 0x0024 (V0)

BEQ R0, R0, End
ADDIU R0, R0, 0x0000

NightTerrain:

LUI A0, 0x0B00
JAL 0x80277F50
ORI A0, A0, 0x0000

LUI T5, 0x5151
ORI T5, T5, 0x5151
SW T5, 0x0000 (V0)

LUI T5, 0x6464
ORI T5, T5, 0x6464
SW T5, 0x0004 (V0)

LUI T5, 0x5c5c
ORI T5, T5, 0x5c50
SW T5, 0x0020 (V0)

LUI T5, 0x5959
ORI T5, T5, 0x5950
SW T5, 0x0024 (V0)

End:
LW RA, 0x0014 (SP)
JR RA
ADDIU SP, SP, 0x0018
