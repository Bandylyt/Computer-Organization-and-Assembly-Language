.model small
.stack 100h

.data
    str1 db 'Enter Number: $'

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

convert_loop:
    xor dx, dx
    mov bx, 10
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne convert_loop

print_loop:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    dec cx
    jnz print_loop

    mov ah, 4Ch
    int 21h

main endp
end main