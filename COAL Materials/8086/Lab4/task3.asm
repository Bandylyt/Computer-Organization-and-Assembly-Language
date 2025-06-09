.model small
.stack 100h
.data
	str3 db 70 dup('$')
	str4 db 70 dup('$')
	str1 db 'Enter a String:$'
	str2 db 10,13, 'Now String is:$'
	
	

.code
	main proc
		mov ax,@data
		mov ds,ax

		mov si,offset str3
		mov di,offset str4

		mov dx,offset str1
		mov ah,09
		int 21h
		
		
	ag: mov si, offset str3		
aa:		mov ah,1
		int 21h
		cmp al,13
		je exit
		mov [si],al
		cmp al,32
		je bb
		inc si
		jmp aa
		
	
bb:		mov bl,[si]
		mov [di],bl
		inc di
		dec si
		jnz bb
		jmp ag


		
		
		
exit:		mov dx,offset str2
		mov ah,09
		int 21h
		mov dx,offset str4
		mov ah,09
		int 21h

		mov ah,4ch
		int 21h
		main endp
		end main
	