.model small
.stack 100h
.data
	str1 db 10,13,'Enter Time in Seconds:$'
	str2 db 10,13,'Hours:$'
	str3 db 10,13,'Minutes:$'
	str4 db 10,13,'Seconds:$'
.code
	main proc
	mov ax,@data
	mov ds,ax
	
	call decin
	call calc


	mov ah,4ch
	int 21h
	main endp

decin proc
	
	mov bx,0
	
	mov dx,offset str1
	mov ah,09
	int 21h
take:	
	mov ah,01
	int 21h
	cmp al,13
	je exit_decin
	sub al,48
	mov cx,0
	mov cl,al
	mov ax,10
	mul bx
	mov bx,ax
	add bx,cx
	jmp take

exit_decin:
	ret
	decin endp


	


calc proc
	
	mov ax,bx
	mov bx,3600
	mov dx,0
	div bx
	push dx
	push ax
	mov dx,offset str2
	mov ah,09
	int 21h
	call decout
	mov bx,60
	mov ax,dx
	mov dx,0
	div bx
	push dx
	push ax
	mov dx,offset str3
	mov ah,09
	int 21h
	call decout
	mov ax,dx
	push dx
	push ax
	mov dx,offset str4
	mov ah,09
	int 21h
	call decout 
	
	ret 
	calc endp





decout proc
	pop cx
	pop ax
	pop dx
	push cx
	push dx	
	
	
output:
	
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
	

again:	
	pop dx
	add dl,48
	mov ah,02
	int 21h
	dec cx
	jnz again

	pop dx
	ret 
decout endp
	
	


end main






