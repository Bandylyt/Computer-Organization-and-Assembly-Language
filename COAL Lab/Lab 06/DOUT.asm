.model small
.stack 100h

.data
    str1 db 'Number in decimal is: $'
    var1 dw 256d

.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset str1
    mov ah, 09h
    int 21h

    mov ax, var1
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