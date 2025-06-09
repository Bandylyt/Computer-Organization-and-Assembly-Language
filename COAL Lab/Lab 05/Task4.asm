.MODEL SMALL
.STACK 100H
.DATA
    prompt DB 'Input String: $'
    palindrome_msg DB 'Output: String is palindrome$'
    not_palindrome_msg DB 'Output: String is not palindrome$'
    str DB 100 DUP('$')   ; String buffer, initialized with '$'
    len Dw 0              ; Variable to store string length

.CODE
MAIN PROC
    ; Initialize the data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt to enter a string
    MOV DX, OFFSET prompt
    MOV AH, 09H
    INT 21H

    ; Input string from user
    LEA DI, str          ; DI points to the start of the string buffer
    XOR CX, CX           ; Clear CX, used to count the string length

INPUT_LOOP:
    MOV AH, 01H          ; Function to read a character from keyboard
    INT 21H
    CMP AL, 13           ; Check if Enter (carriage return) is pressed
    JE DONE_INPUT
    MOV [DI], AL         ; Store the input character in the string buffer
    INC DI               ; Move to the next position in the string buffer
    INC CX               ; Increment the length counter
    JMP INPUT_LOOP

DONE_INPUT:
    MOV AL, '$'          ; Load '$' into AL
    MOV [DI], AL         ; Null-terminate the string with '$'
    MOV len, CL          ; Store the length of the string in len
    DEC DI               ; Set DI to point to the last character in the string

    ; Palindrome check using stack
    LEA SI, str          ; SI points to the start of the string
    MOV BX, DI           ; BX points to the last character in the string
    MOV CX, len          ; Load the length of the string into CX
    SHR CX, 1            ; Divide the length by 2, to loop half of the string

PUSH_LOOP:
    MOV AL, [SI]         ; Load character into AL
    PUSH AX              ; Push the character onto the stack (AX contains AL)
    INC SI               ; Move to the next character in the string
    LOOP PUSH_LOOP       ; Repeat until half of the string is pushed onto the stack

    MOV CX, len          ; Reload the length into CX
    SHR CX, 1            ; Divide the length by 2 again

POP_LOOP:
    POP AX               ; Pop character from the stack (AL contains the character)
    MOV DL, [BX]         ; Load corresponding character from the end of the string
    CMP DL, AL           ; Compare the two characters
    JNE NOT_PALINDROME   ; If they are not equal, it's not a palindrome
    DEC BX               ; Move to the previous character in the string
    LOOP POP_LOOP        ; Repeat until all characters are checked

    ; If we reach here, the string is a palindrome
    MOV DX, OFFSET palindrome_msg
    JMP PRINT_MSG

NOT_PALINDROME:
    MOV DX, OFFSET not_palindrome_msg

PRINT_MSG:
    MOV AH, 09H
    INT 21H              ; Print the message

    ; Exit the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
