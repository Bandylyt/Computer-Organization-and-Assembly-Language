.model small
.stack 100h
.data
	str1 db 10,13,'Enter First Number:$'
	str3 db 10,13,'Enter Operation:$'
	str2 db 10,13,'Enter Second Number:$'
	str4 db 10,13,'Result is:$'
	var db 0
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	lea dx,str1
	mov ah,09
	int 21h
	
	mov ah,01
	int 21h
	sub al,48
	mov bl,al

	lea dx,str3
	mov ah,09
	int 21h	

	mov ah,01
	int 21h
	mov var,al

	lea dx,str2
	mov ah,09
	int 21h	

	mov ah,01
	int 21h
	sub al,48
	mov bh,al

	mov al,var
	cmp al,'+'
	je plus
	cmp al,'*'
	je prod
	cmp al,'^'
	je pow

plus:	
	call plus_1
	call ho
	jmp exit
prod:	
	call prod_1
	call ho
	jmp exit
pow:	
	call pow_1
	call ho
	jmp exit

exit:	
	
	mov ah,4ch
	int 21h
	main endp
	
	plus_1 proc
	xor ax,ax
	xor cx,cx
	mov ch,bh
incr:
	inc bl
	dec ch 
	jnz incr
	mov al,bl
	
	ret
	plus_1 endp


	prod_1 proc
	xor ax,ax
	xor cx,cx
	mov ch,bh
	dec ch
	mov bh,0
	mov ax,bx
addd:
	add bx,ax
	dec ch 
	jnz addd
	mov ax,bx
	
	ret
	prod_1 endp

	pow_1 proc
	xor ax,ax
	xor cx,cx
	mov ch,bh
	mov bh,0
	dec ch
	mov al,bl
mullt:
	mul bl
	dec ch 
	jnz mullt
	
	
	ret
	pow_1 endp

	ho proc
	mov bx,10
	push ax
	lea dx,str4
	mov ah,09
	int 21h
	pop ax
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
	ret
	ho endp



end main
	
	
	
	
	
	
	
	
	
	
	
	
	
	