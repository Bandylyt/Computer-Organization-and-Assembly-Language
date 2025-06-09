.model small
.stack 100h
.data 
    str1 db 'Good Morning$'
.code
main proc
    MOV SI, offset str1
aa: MOV BL, [si]
    cmp bl, '$'
    je exit
    and bl, 0DFh
    mov [si], bl
    inc si
    jmp aa
exit: 
    mov dx, offset str1
    mov ah, 09
    int 21h
    mov ah, 4ch
    int 21h
main endp
end main