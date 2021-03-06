; new set music with conditional branches according to time of the day

; 36 08 00 00 [00 66] [day_song night-song]

; if != 66, command remains the same as original one

.ORG 0x80405a40

LUI T6, 0x8039
LH T6, 0xB8AC (T6)
ADDIU AT, R0, 0xFFFF
BEQ T6, AT, End
ADDIU R0, R0, 0x0000
LUI T0, 0x8039
LH T0, 0xB8AC (T0)
LUI T7, 0x8039
LW T7, 0xBE28 (T7)
LUI T9, 0x8033
LW T9, 0xDDC8 (T9)
SLL T1, T0, 0x4
LH T8, 0x0002 (T7)
SUBU T1, T1, T0
SLL T1, T1, 0x2
ADDU T2, T9, T1
SH T8, 0x0036 (T2)
LUI T6, 0x8039
LH T6, 0xB8AC (T6)
LUI T3, 0x8039
LW T3, 0xBE28 (T3)
LUI T5, 0x8033
LW T5, 0xDDC8 (T5)
SLL T7, T6, 0x4
LH T4, 0x0004 (T3)     ; song number

ADDIU AT, R0, 0x66 
BNE AT, T4, Regular
ADDIU R0, R0, 0x0000

ConditionalDayNight:

LUI AT, 0x8040
ORI AT, AT, 0x0004
LB AT, 0x0000 (AT)

SLTIU AT, AT, 0x0009
BEQ AT, R0, NightMusic
ADDIU R0, R0, 0x0000

DayMusic:

LB T4, 0x0006 (T3)     ; Day Song

BEQ R0, R0, Regular
ADDIU R0, R0, 0x0000

NightMusic:
LB T4, 0x0007 (T3)     ; Night Song

Regular:
SUBU T7, T7, T6
SLL T7, T7, 0x2
ADDU T0, T5, T7
SH T4, 0x0038 (T0)

End:
LUI T9, 0x8039
LW T9, 0xBE28 (T9)
LUI AT, 0x8039
LBU T1, 0x0001 (T9)
ADDU T8, T9, T1
SW T8, 0xBE28 (AT)
JR RA
ADDIU R0, R0, 0x0000
