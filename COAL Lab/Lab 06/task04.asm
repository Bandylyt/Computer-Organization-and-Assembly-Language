.model small
.stack 100h

.data
    str1 db 'Enter Number: $'
    var1 dw 0
    var2 dw 2
    str2 db 10,13,'Number is not prime$'
    str3 db 10,13,'Number is prime$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset str1
    mov ah, 09h
    int 21h


    xor cx, cx
    MOV BX, 0

again:
    MOV AH, 01
    INT 21h
    CMP AL, 13
    JE exit
    SUB AL, 48
    MOV CL, AL
    MOV CH, 0
    MOV Ax, bx
    MOV BX, 10
    MUL BX
    ADD AX, cx
    mov bx, ax
    jmp again

exit:
    xor ax, ax
    mov ax, bx
    xor cx, cx

    mov var1, ax

lopy: MOV DX, 0
    MOV CX, var2
    DIV CX

    CMP DX, 0
    JE NO_PRIME


    INC var2
    MOV AX, var1
    CMP var2, AX
    je prime_is
    jmp lopy

prime_is:
    MOV DX, offset str3
    MOV AH, 09 
    INT 21h
    JMP exITTT
NO_PRIME:
    MOV DX, offset str2
    MOV AH, 09 
    INT 21h

exITTT:    MOV ah, 4ch
    int 21h


main endp 
end main





