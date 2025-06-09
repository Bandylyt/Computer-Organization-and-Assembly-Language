.model small
.stack 100h
.data
	str1 db 10,13,'Enter first Number:$'
	str2 db 10,13,'Enter Second Number:$'
	str3 db 10,13,'Difference is:$'
	
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov dx,offset str1
	mov ah,09
	int 21h
	call decin
	push bx

	mov dx,offset str2
	mov ah,09
	int 21h
	call decin
	push bx
	
	pop cx
	pop bx
	
	sub bx,cx
	call decout
	mov ah,4ch
	int 21h
	main endp



decin proc
	mov bx,0
	
take:	
	mov ah,01
	int 21h
	cmp al,13
	je exit_in
	sub al,48
	mov cx,0
	mov cl,al
	mov ax,10
	mul bx
	mov bx,ax
	add bx,cx
	jmp take
exit_in:
	ret
decin endp



decout proc
	output:
	mov ax,bx
	mov bx,10
	mov cx,0
	
divide:
	mov dx,0
	div bx 
	push dx
	inc cx
	cmp ax,0
	je display
	jmp divide

	

display:
	mov dx,offset str3
	mov ah,09
	int 21h

again:	
	pop dx
	add dl,48
	mov ah,02
	int 21h
	dec cx
	jnz again
	ret
decout endp

end main