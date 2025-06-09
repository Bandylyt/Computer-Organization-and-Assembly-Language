.model small
.stack 100h
.data
    str1 db 10,13, 'Enter String: $'
    str2 db 10, 13, 'Output: $'
    str4 db 10 dup('$')
    VAR1 db 0
    var2 db 1

.code
main proc
    Mov ax, @data
    mov ds, ax
    MOV SI, OFFSET str4
    mov dx, offset str1
    mov ah, 09
    int 21h

ag: Mov ah, 01
    int 21h

    CMP al, 13
    JE aa
    xor bx,bx
    mov bl, al
    
    MOV [SI], bl
    INC SI
    INC VAR1
    
    Jmp ag

aa:MOV DI, OFFSET str4 
nn:   MOV si, offset str4
agh: jmp variable
    inc var2
bb:  Mov bl, [DI]
     inc SI
     Mov CL, [si]
     CMP BL, CL
     JE remove
     jmp bb

variable: mov dl, var2
    inc si
    dec dl
    jnz variable
    jmp bb

remove: MOV DL, '0'    
    Mov [DI], DL
    Mov [SI], DL
    INC DI
    jmp nn

    mov dx, offset str2
    mov ah, 09
    int 21h

    mov dx, offset str4
    mov ah, 09
    int 21h



    mov ah, 4Ch
    int 21h



main endp
end main

