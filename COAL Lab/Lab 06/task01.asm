.model small
.stack 100h

.data
    str1 db 10,13,'Enter operand: $'
    var1 dw 0d
    var2 dw 0
    var3 dw 0d
    str2 db 10,13,'Enter operator: $'
    str3 db 10,13,'Answer is: $' 
    res  dw 0

.code
main proc
    mov ax, @data
    mov ds, ax
    xor ax, ax

lopy_main: mov var2, 2
tagy: mov var1, ax
      xor ax, ax
ag2: mov dx, offset str1
    mov ah, 09h
    int 21h


    xor cx, cx
    MOV BX, 0

again: MOV AH, 01
    INT 21h
    CMP AL, 13
    JE exit
    CMP al, 'x'
    JE Terminate
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
    dec var2
    jnz tagy
    MOV var3, ax

    Mov dx, offset str2
    MOV ah, 09
    int 21h


   
    MOV ah, 01
    INT 21h

    CMP AL, '*'
    JE multiply

    CMP AL, '+'
    JE addition

    CMP AL, '-'
    JE subtract

    CMP AL, '%'
    JE moded

multiply:
    MOV DX, 0
    MOV ax, var1
    MOV bx, var3
    MUL BX  
    
    JMP exitt

addition:
    MOV ax, var1
    mov bx, var3
    add ax, bx
    jmp exitt
subtract:
    MOV ax, var1
    mov bx, var3
    sub ax, bx
    jmp exitt
moded:
    MOV DX, 0
    MOV ax, var1
    MOV bx, var3
    DIV  BX
    MOV AX, DX
    JMP exitt


exitt: 
    MOV res, AX
    xor cx, cx
    MOV dx, offset str3
    MOV ah, 09
    int 21h 
    xor ax, ax
    MOV ax, res
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

    JMP lopy_main

Terminate:
    mov ah, 4Ch
    int 21h

main endp
end main