.model small
.stack 100h
.386
.data
	str1 db 10,13, 'Enter a HEX Number (0 to FFFF):$'
	str2 db 10,13, 'In Binary it is: $'
	str3 db 10,13, 'Illegal HEX Number $'
	
	
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov bl,0
	
correct:	
	mov dx,offset str1
	mov ah,09
	int 21h
	
input:	
	mov ah,01
	int 21h
	cmp al,70
	jg invalid
	cmp al, 58
	je invalid
	cmp al, 59
	je invalid
	cmp al, 60
	je invalid
	cmp al, 61
	je invalid
	cmp al, 62
	je invalid
	cmp al, 63
	je invalid
	cmp al, 64
	je invalid
	cmp al,13
	je display
	cmp al,'9'
	jbe digit
	sub al,07h
	
digit:	
	sub al,30h
	shl bx,4
	or bl,al
	jmp input

display:
	mov dx,offset str2
	mov ah,09
	int 21h
	mov cl,16

again:	
	mov dl,0
	shl bx,1
	rcl dl,1
	add dl,48
	mov ah,02
	int 21h
	dec cl
	jnz again
	jmp exit

invalid:	
	mov dx,offset str3
	mov ah,09
	int 21h
	jmp correct

exit:
	mov ah,4ch
	int 21h
	main endp
	end main