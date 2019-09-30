.ORIG x3000

    LEA R0, PROMPT
    PUTs                ; TRAP x22
    LD R0, ENTER
    OUT                 ; TRAP x21
    IN                  ; TRAP x23

    AND R5, R5, #0      ; clear R5
    ADD R5, R5, R0      ; Store the user input into R5

    AND R1, R1, #0      ; clear R1, R1 is our loop count
    LD R2, MASK_COUNT   ; load our mask limit into R2
    NOT R2, R2          ; Invert the bits in R2
    ADD R2, R2, #1      ; because of 2's compliment we have
                        ; to add 1 to R2 to get -4
WHILE_LOOP
    ADD R3, R1, R2      ; Adding R1, and R2 to see if they'll
                        ; will equal zero
    BRz LOOP_END        ; If R1+R2=0 then we've looped 4
                        ; times and need to exit

    LEA R3, BINARY      ; load the first memory location 
                        ; in our binary mask array
    ADD R3, R3, R1      ; use R1 as our array index and
                        ; add that to the first array location
    LDR R4, R3, #0      ; load the next binary mask into R4

    AND R4, R4, R5      ; AND the user input with the 
                        ; binary mask
    BRz NO_BIT
    LD R0, ASCII_ONE
    OUT                 ; TRAP x21
    ADD R1, R1, #1      ; add one to our loop counter
    BRnzp WHILE_LOOP    ; loop again
NO_BIT
    LD R0, ASCII_ZERO
    OUT                 ; TRAP x21

    ADD R1, R1, #1      ; add one to our loop counter
    BRnzp WHILE_LOOP    ; loop again
LOOP_END

    LD R0, ENTER
    OUT                 ; TRAP x21
    HALT                ; TRAP x25

; Binary Maps
BINARY  .FILL   b1000
	.FILL   b0100
	.FILL   b0010
	.FILL   b0001
; Stored Values
ENTER       .FILL   x000A
ASCII_ZERO  .FILL   x0030
ASCII_ONE   .FILL   x0031
MASK_COUNT  .FILL   x16     ; loop limit = 16
PROMPT      .STRINGZ "Enter a number from 0-9"

.END