.model small
.stack 100h
.data
	str1 db 10,13,'Enter a String: $'
	str2 db 10,13,'not a palindrome: $'
        str3 db 10,13,'is a palindrome: $'
	array1 db  20 dup(0)
        array2 db  20 dup(0)
.code
	main proc
	mov ax,@data
	mov ds,ax
        mov si,offset array1
       mov cl,0

        mov dx,offset str1
	mov ah,09
	int 21h

again1:  mov ah,01
        int 21h 
        cmp al,13
        je  save
        inc cl
        mov [si],al
        inc si
        push ax
        jmp again1

save:  mov ch,cl
    
      mov si,offset array2
again2: pop ax 
        mov [si],al
        inc si 
        dec cl
        jnz again2
mov si,offset array1
mov di,offset array2
  dec si
   dec di
again3:inc si
       inc di
      mov bl,[si]
      mov bh,[di]
      cmp bl,bh
      jne again4
      dec ch
      jnz again3

       mov dx,offset str3
	   mov ah,09
	int 21h
        jmp exit

      

again4:
        mov dx,offset str2
	mov ah,09
	int 21h
        jmp exit


         


		
	
exit:	mov ah,4ch
	int 21h
	main endp
end main
	
	
	
	