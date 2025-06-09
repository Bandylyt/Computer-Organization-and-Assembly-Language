.model small
.stack 100h
.data
	str1 db 10,13,'Enter First Number:$'
	str2 db 10,13,'Enter Second Number:$'
	str3 db 10,13,'GCD is:$'
.code
	main proc
	mov ax,@data
	mov ds,ax

	mov dx,offset str1
	mov ah,09
	int 21h
	
	call decin

	mov cx,bx

	mov dx,offset str2
	mov ah,09 
	int 21h
	
	call decin
	
	mov ax,cx
step1:
	mov dx,0
	div bx
	cmp dx,0
	je display1
	mov ax,bx
	mov bx,dx
	jmp step1
	
	
display1:
	mov dx,offset str3
	mov ah,09
	int 21h
	call decout
	
	mov ah,4ch
	int 21h
	main endp




	
decin proc

	push cx
	
	mov bx,0
		
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
	pop cx
	ret
	decin endp





decout proc

	mov ax,bx

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

	
	ret 
decout endp
	
	


end main
