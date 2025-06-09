.model Small
.stack 100h
.data
    str1 db 10,13,'Enter string: $'
    str2 db 20 dup('?')

    str3 db 20 dup('?')
    counter db 0
    counter2 db 0

    str4 db 10,13,'Enter integer: $'
    new db 10,13,'New String is: $'
.code
    Mov ax, @data
    mov ds, ax
    mov es, ax

    Mov dx, offset str1
    mov ah, 09
    int 21h

    mov di, offset str2

again: Mov ah, 01
    int 21h

    cmp al, 13
    je exit

    stosb

    inc counter

    jmp again
exit:
    Mov dx, offset str1
    mov ah, 09
    int 21h

    mov di, offset str3

again2: Mov ah, 01
    int 21h

    cmp al, 13
    je exit

    stosb

    inc counter2

    jmp again2



    Mov dx, offset str4
    mov ah, 09
    int 21h

    Mov ah, 01
    int 21h

    SUB AL, 48


    Mov dx, offset new
    Mov ah, 09
    int 21h






    Mov di, offset str2
    mov si, offset str3

tag: Mov dl, [di]
    Mov ah, 02
    int 21h
    inc di
    dec counter
    sub al,1

    jnz tag

 omg: Mov dl, [si] 
    mov ah, 02
    int 21h

    inc si
    dec counter2
    jnz omg

tag2: Mov dl, [di]
    Mov ah, 02
    int 21h
    dec counter
    jnz tag2


    Mov ah, 4ch
    int 21h

main endp
end main
    





