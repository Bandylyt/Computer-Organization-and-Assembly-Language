.model small
.stack 100h

.data
    str1 db 'Enter odd Number: $'
    input dw 0d
    printcount dw 0d
    str2 db 10, 13, '$'
    str3 db 5 dup('$')
    str4 db 'Enter a string: $'
    count dw 3
    var1 dw  0   
    last_counter dw 2
    
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

    mov input, ax

    Mov bx, 2
    Div bx

    INC ax
    MOV printcount, ax


    MOV DX, offset str4
    MOV ah, 09
    int 21h

    MOv si , offset str3

ag: MOV AH, 01
    int 21h 

    and al, 0dfh 
     MOV [SI], al
    inc SI 
    
    dec count
    jnz ag

    
    MOV dx, offset str2
    MOV ah, 09
    int 21h

lopy: MOV BX, 0
      MOV BX, input


lopy1: MOV CX, input
       CMP BX, printcount
       JE LOCATION  
       
       
lopy2:MOV Dl, '*'
    Mov ah, 02
    int 21h

    SUB CX,1
    jnz lopy2

    MOV dx, offset str2
    mov ah, 09
    int 21h
     

    SUB Bx,1
    jnz lopy1
    jmp ending


LOCATION: 
   
bb: MOV cx, input
    
    SUB CX, 3 
    
    XOR AX, AX
    
    MOV AX, CX
    MOV CX, 2
    mov dx, 0
    DIV CX
    
    MOV var1, ax

aa: MOV Dl, '*'
    Mov ah, 02
    int 21h


    dec var1
    jnz aa
    dec last_counter
    jz ddd  
    
start:    MOV var1, 3
    MOV DI, offset str3

cc: MOV dl, [di]
    MOV ah, 02
    int 21h
    inc di
    dec var1
    jnz cc 

    jmp bb

ddd:MOV DX, offset str2
    MOV ah, 09
    int 21h 
     dec bx
    jmp lopy1 

ending:    mov ah, 4Ch
    int 21h


main endp
end main