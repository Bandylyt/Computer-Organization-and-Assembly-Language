.model small
.stack 100h
.data
	str1 db 10,13,'Enter Character: $'
	str2 db 10,13,'Ascii in Decimal: $'
	str3 db 10,13,'Ascii in Hex: $'
	str4 db 10,13,'Ascii in Binary: $'
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov dx,offset str1
	mov ah,09
	int 21h
	
	mov ah,01	
	int 21h
	mov cl,al	
	
	mov bx,10
	mov dx,offset str2
	mov ah,09
	int 21h
	call asciio
	mov bx,16
	mov dx,offset str3
	mov ah,09
	int 21h
	call asciio
	mov bx,2
	mov dx,offset str4
	mov ah,09
	int 21h
	call asciio
	
	mov ah,4ch
	int 21h
	main endp
	
	

	asciio proc
	mov ax,cx
	push cx
	mov cx,0
again_ascii:
	mov dx,0
	div bx
	push dx
	inc cx
	cmp ax,0
	je display_ascii
	jmp again_ascii

display_ascii:

	pop dx
	cmp dx,9
	jbe digit
	add dx,7
digit:
	add dx,48
	mov ah,02
	int 21h
	dec cx
	jnz display_ascii
	pop cx
	ret
	asciio endp

end main
	
	
	
	