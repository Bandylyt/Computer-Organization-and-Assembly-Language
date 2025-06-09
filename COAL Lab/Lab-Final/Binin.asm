.model small
.stack 100h

.data
    str1 db 'Enter a number in binary: $'
    str2 db 10,13, 'The output: $'
 

.code
    main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset str1
    mov ah, 09
    int 21h


    Mov CX, 8 ;8 bit number 
    
    ;Binary input starts

ag: 

    Mov ah, 01
    int 21h

    cmp al, 13
    je exit

    SUB al, 30h
    Shl bx, 1
    or bl, al
    dec cx

    jnz ag


exit:    
    ; out is in bx
    MOV ah, 4ch
    int 21h

main endp
end main



