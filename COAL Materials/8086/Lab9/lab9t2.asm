.model small
.stack 100h
.data
	str1 db 50 dup('$')
	str2 db 10,13,'Enter a String:$'
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	lea di,str1
	
	
	lea dx,str2
	mov ah,09
	int 21h
again:
	mov ah,01
	int 21h
	cmp al,13
	je exit
	stosb
	jmp again
exit:	

	lea dx,str1
	mov ah,09
	int 21h

	mov ah,4ch
	int 21h
	main endp
	end main
	