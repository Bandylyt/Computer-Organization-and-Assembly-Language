.model small
.stack 100h
.data
	str1 db 10,13,'Enter Input:$'
	str2 db 10,13,'Answer is:$'
	fo dw 0
	so dw 0
	op db 0
.code
	main proc
	mov ax,@data
	mov ds,ax
input_a:
	lea dx,str1
	mov ah,09
	int 21h

	call decimal_input
	mov fo,bx
	cmp al,'x'
	je exit_main
	mov ah,01
	int 21h
	mov op,al
	mov ah,01
	int 21h
	call decimal_input
	mov so,bx
	mov ah,01
	int 21h
	
	mov al,op
	cmp al,'+'
	je plus_t
	cmp al,'*'
	je prod_t
	cmp al,'-'
	je subt_t
	cmp al,'%'
	je modd_t
plus_t:
	call plus_f
	call decimal_output
	jmp input_a
prod_t:
	call mul_f
	call decimal_output
	jmp input_a
subt_t:
	call sub_f
	call decimal_output
	jmp input_a
modd_t:
	call mod_f
	call decimal_output
	jmp input_a
	
	
	
	
exit_main:
	mov ah,4ch
	int 21h
	main endp
	
	
	
	

	
	
	



	decimal_input proc
d:	
	mov bx,0
d_in:
	mov ah,01
	int 21h
	cmp al,32
	je exit
	cmp al,'x'
	je exit
	sub al,48
	mov ah,0
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp d_in
exit:
	ret
	decimal_input endp



plus_f proc
	mov bx,fo
	add bx,so
	ret
	plus_f endp

sub_f proc
	mov bx,fo
	sub bx,so
	ret
	sub_f endp

mul_f proc
	mov ax,fo
	mov bx,so
	mul bx
	mov bx,ax
	ret
	mul_f endp
	
mod_f proc
	mov ax,fo
	mov bx,so
	xor dx,dx
	div bx
	mov bx,dx
	ret
	mod_f endp

decimal_output proc
d_out:
	lea dx,str2
	mov ah,09
	int 21h
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
	ret
decimal_output endp
	
	
	

	

end main

	
	
	
	
	
	
	
	
	
	
	
	
	
	