.ORIG X3000

ARRAY .BLKW #5 ; allocate 5 memory spaces for an array

START_LOOP
LD R0, VAR_I ;LOAD 0 INTO R0
LD R1, VAR_N ; LOAD 5 INTO R1
NOT R1, R1 ;
ADD R1, R1, #1; MAKE R1 NEGATIVE 5
ADD R0, R0, R1 ; ADD -5 TO R0
BRzp END_LOOP

LEA R0, PROMPT ; LOAD PROMPT INTO R0
PUTS ; PRINT PROMPT
GETC ; get input from user
OUT ; print to screen

LD R1, ASCII_OFFSET
ADD R0, R0, R1 ; convert ascii to number

LEA R1, ARRAY
LD R2, VAR_I
ADD R1, R1, R2
STR R0, R1, #0 ; store getc into r1 or the first spot of the array

LD R0, VAR_I
ADD R0, R0, #1
ST R0, VAR_I
BRnzp START_LOOP
END_LOOP

HALT

VAR_I .FILL #0
VAR_N .FILL #5
ASCII_OFFSET .FILL #-48
PROMPT .STRINGZ "\nPlease enter a number 0-9: "

.END