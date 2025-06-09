.model small
.stack 100h
.data
	str1 db 'aeiouAEIOU'
	str2 db 10,13,'Enter a String:$'
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	mov bx,0
	
	
	
	lea dx,str2
	mov ah,09
	int 21h
again:
	lea di,str1
	mov cx,11
	mov ah,01
	int 21h
	cmp al,13
	je exit
	repne scasb
	cmp cx,0
	je notadd
	inc bx
	jmp again

notadd:
	jmp again

exit:	
	mov cx,0
	mov ax,bx
	mov bx,10
	
outp:
	mov dx,0
	div bx
	push dx
	inc cx
	cmp ax,0
	je display
	jmp outp

display:
	pop dx
	cmp dx,9
	jbe digit
	add dx,7
digit:
	add dx,48
	mov ah,02
	int 21h	
	dec cx
	jnz display
	
	mov ah,4ch
	int 21h
	main endp
	end main
	