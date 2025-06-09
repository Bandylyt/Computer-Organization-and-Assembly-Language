.Model Small
.Stack 100h

.data
    str1 db 'Enter a string: $'
    str2 db 20 dup('$')
    str3 db 10,13, 'Modified: $'

.code
    main proc
    Mov ax, @data
    mov ds, ax
    mov es, ax


    Mov dx, offset str1
    mov ah, 09
    int 21h

    cld
    Mov cx, 0
    Mov di, offset str2

again: Mov ah, 01
      int 21h
      cmp al, ' '
      jne second
      jmp again


second:
    stosb
    Mov ah, 01
    int 21h
    Cmp al, 13
    je go
    inc cx
    jmp second



go:
    Mov dx, offset str3
    mov ah, 09
    int 21h

    mov dx, offset str2
    mov ah, 09
    int 21h


    Mov ah, 4ch
    int 21h


main endp
end main




