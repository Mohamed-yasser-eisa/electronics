$include (c8051F020.INC)
MOV WDTCN,#0DEh
MOV WDTCN,#0ADh
TABLE EQU 100H
ORG 0000H

main:
MOV DPTR,#TABLE
CALL onGreen
CALL onYellow
CALL onRed
CALL off
JMP main


onGreen: ;fuction turn on green LED
		MOV P0,#1 ;turn on LED
		MOV R3,#30 ; for 30 sec counter
		MOV A,#00
counter1:
		CALL delay ;delay for 1 sec & output in 7 segment
		; 7 segment code
		DJNZ R3,counter1 
		RET

onYellow:
	MOV P1,#00000010
	MOV R4,#30
counter2:
	CALL delay
	DJNZ R4,counter2
	RET

onRed:
MOV P1,#00000100
	MOV R5,#30
counter3:
	CALL delay
	DJNZ R5,counter3
	RET

off:
MOV P0,#00000000 ;turn off all LEDs
RET


; delay = 1 sec
delay:
MOV R0,#134
MOV R1,#146
MOV R2,#7
loop2:DJNZ R0,loop2
			DJNZ R1,loop2
		  DJNZ R2,loop2

RET

ORG TABLE
DB 00000000B  ; Binary of 0
DB 00000001B	;1
DB 00000010B	;2
DB 00000011B	;3
DB 00000100B	;4
DB 00000101B	;5
DB 00000110B	;6
DB 00000111B	;7
DB 00001000B	;8
DB 00001001B	;9
DB 00001010B	;10



END