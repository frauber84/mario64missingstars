;  Sets terrain RGB according to time of the day
;  UNUSED (simpler version is used instead)


ADDIU SP, SP, 0xFFE8 
SW RA, 0x0014 (SP)

LUI T5, 0x8040
ORI T5, T5, 0x0004
LB T5, 0x0000 (T5)     ;   current day-night cycle (0x01 to 0x13)



SLTIU T6, T5, 0x010
BEQ T6, R0, NightTerrain
ADDIU R0, R0 ,0x0000

SLTIU T6, T5, 0x00c
BEQ T6, R0, MiddleNight
ADDIU R0, R0 ,0x0000

SLTIU T6, T5, 0x0009
BEQ T6, R0, Evening
ADDIU R0, R0 ,0x0000

SLTIU T6, T5, 0x0006
BEQ T6, R0, Afternoon
ADDIU R0, R0 ,0x0000

SLTIU T6, T5, 0x0003
BEQ T6, R0, Morning
ADDIU R0, R0 ,0x0000

Morning:

LUI A0, 0x0B00
JAL 0x80277F50         ;  segmented_to_virtual
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

Afternoon:

LUI A0, 0x0B00
JAL 0x80277F50         ;  segmented_to_virtual (return V0)
ORI A0, A0, 0x0000

LUI T5, 0x0000
ORI T5, T5, 0x7010
SW T5, 0x0000 (V0)

LUI T5, 0xFFFF
ORI T5, T5, 0xFFFF
SW T5, 0x0004 (V0)

LUI T5, 0x4C4C
ORI T5, T5, 0x4C00
SW T5, 0x0020 (V0)

LUI T5, 0x999F
ORI T5, T5, 0x9900
SW T5, 0x0024 (V0)

BEQ R0, R0, End
ADDIU R0, R0, 0x0000


Evening:

LUI A0, 0x0B00
JAL 0x80277F50         ;  segmented_to_virtual (return V0)
ORI A0, A0, 0x0000

LUI T5, 0x0001
ORI T5, T5, 0x1010
SW T5, 0x0000 (V0)

LUI T5, 0xFFFF
ORI T5, T5, 0xFFFF
SW T5, 0x0004 (V0)

LUI T5, 0x5C4C
ORI T5, T5, 0x5400
SW T5, 0x0020 (V0)

LUI T5, 0x8999
ORI T5, T5, 0x8900
SW T5, 0x0024 (V0)

BEQ R0, R0, End
ADDIU R0, R0, 0x0000

MiddleNight:

LUI A0, 0x0B00
JAL 0x80277F50         ;  segmented_to_virtual (return V0)
ORI A0, A0, 0x0000

LUI T5, 0x6151
ORI T5, T5, 0x6151
SW T5, 0x0000 (V0)

LUI T5, 0x7464
ORI T5, T5, 0x7464
SW T5, 0x0004 (V0)

LUI T5, 0x6c5c
ORI T5, T5, 0x6c50
SW T5, 0x0020 (V0)

LUI T5, 0x6959
ORI T5, T5, 0x6950
SW T5, 0x0024 (V0)

BEQ R0, R0, End
ADDIU R0, R0, 0x0000


NightTerrain:

LUI A0, 0x0B00
JAL 0x80277F50         ;  segmented_to_virtual (return V0)
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
