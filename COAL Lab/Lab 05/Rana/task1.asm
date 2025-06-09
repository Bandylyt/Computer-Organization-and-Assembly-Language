.model small
.stack 100h
.386
.data
    str1 db 10, 13, 'Enter a binary number: $'
    str2 db 10, 13, ' hex is : $'
    array1 db  5 dup(0)
.code
main proc
    mov ax, @data
    mov ds, ax

    mov si,offset  array1
    
    mov cl, 5

    
 lop:   mov dx, offset str1
        mov ah, 09h
        int 21h

        call bin

        mov [si],bl
        inc si
        dec cl
        jnz lop
	
    mov si,offset  array1
    mov cl, 5


  lopp:  
        mov dx, offset str2
        mov ah, 09h
        int 21h
        
       mov bl,[si]

       call hex

       inc si
       dec cl
       jnz lopp
	


   
       
    mov ah, 4ch
    int 21h
main endp
bin proc
     mov ch, 8

   again1:
       mov ah, 01h
       int 21h
       sub al, 30h
       shl bx, 1
       or bl, al
       dec ch
       jnz again1
       ret
bin endp
hex proc
   mov ch, 2
   

again:
    rol bl, 4
    mov dl, bl
    and dl, 0fh
    cmp dl, 9
    jbe digit
    add dl, 7h

digit:
   add dl, 30h
    mov ah, 02h
    int 21h
    dec ch
    jnz again
    
    ret
hex endp
end main
