$include (c8051F020.INC)
MOV WDTCN,#0DEh
MOV WDTCN,#0ADh
TABLE EQU 100H
   

ORG 0000H

main:

MOV DPTR,#TABLE

CALL onGreen			;fuction turn on green LED
CALL onYellow			;fuction turn on yello LED
CALL onRed				;fuction turn on red LED
CALL off					;fuction turn off all LEDs

JMP main


onGreen: 
		MOV P0,#1 ;turn on green LED
		
		MOV R1,#00 ; COUNTER
		MOV A,R1
		MOV B,#10
		DIV AB
		MOVC A,@A+DPTR  ;The Quotient of division (left segment)
		MOV P2,A
		MOV A,B
		MOVC A,@A+DPTR  ;The Remainder of division (right segment)
		MOV P1,A

		MOV R0,#30 ;for 30 second counter
counter1:
		CALL delay ;delay for 1 sec
		INC R1
		DJNZ R0,counter1 
		RET

onYellow:
	MOV P1,#2 ;turn on yellow LED
		
		MOV R1,#00 ; COUNTER
		MOV A,R1
		MOV B,#10
		DIV AB
		MOVC A,@A+DPTR  ;The Quotient of division (left segment)
		MOV P2,A
		MOV A,B
		MOVC A,@A+DPTR  ;The Remainder of division (right segment)
		MOV P1,A

		MOV R0,#30 ;for 30 second counter
counter2:
		CALL delay ;delay for 1 sec
		INC R1
		DJNZ R0,counter2 
		RET

onRed:
		MOV P1,#3	 ;turn on red LED
		
		MOV R1,#00 ; COUNTER
		MOV A,R1
		MOV B,#10
		DIV AB
		MOVC A,@A+DPTR  ;The Quotient of division (left segment)
		MOV P2,A
		MOV A,B
		MOVC A,@A+DPTR  ;The Remainder of division (right segment)
		MOV P1,A

		MOV R0,#30 ;for 30 second counter
counter3:
		CALL delay ;delay for 1 sec
		INC R1
		DJNZ R0,counter3 
		RET

off:
MOV P0,#00 ;turn off all LEDs
RET


; delay = 1 sec
delay:
MOV R6,#134
MOV R7,#146
MOV R2,#7
loop2:DJNZ R6,loop2
			DJNZ R7,loop2
		  DJNZ R2,loop2

RET

ORG TABLE
DB 3FH	;0
DB 06H	;1
DB 5BH	;2
DB 4FH	;3
DB 66H	;4
DB 6DH	;5
DB 7DH	;6
DB 07H	;7
DB 7FH	;8
DB 6FH	;9




END