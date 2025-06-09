.model small
.stack 100h
.data
	str3 db 50 dup('$')
	str1 db 'Enter a Word:$'
	str2 db 10,13, 'In Reverse Order:$'
	
	

.code
	main proc
		mov ax,@data
		mov ds,ax

		mov si,offset str3
        
		mov dx,offset str1
		mov ah,09
		int 21h
		
aa:		mov ah,1
		int 21h
		cmp al,13
		je exit
		mov [si],al
		inc si
		jmp aa

exit:	dec si
		mov dx,offset str2
		mov ah,09
		int 21h
bb:		mov dl,[si]
		mov ah,02
		int 21h
		dec si
		jnz bb
		mov ah,4ch
		int 21h
main endp
end main
	