.model small
.386
.stack 100h
.data 
    str1 db 'enter charcter: $'
    str2 db 'Output: $'
.code 
    MAIN PROC

    mov ax, @data
    mov ds, ax
    
    mov dx, offset str1
    mov ah, 09
    int 21h

    mov ah, 01
    int 21h

    mov bl, al

    mov dx, offset str2
    mov ah, 09
    int 21h

    mov cl, 8

again: SHL BL, 1
    JC tag
    mov dl, '0'
    
    mov ah, 02
    int 21h
    jmp loopy
tag: mov dl, 31h
    mov ah, 02
    int 21h

loopy: dec cl
    jnz again

    mov ah, 4Ch
    int 21h
main endp 
end main