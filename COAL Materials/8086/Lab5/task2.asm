.model small
.stack 100h
.386
.data
	str1 db 10,13, 'Enter a Character:$'
	str2 db 10,13, 'The ASCII code in HEX is: $'
	
.code
	main proc
	mov ax,@data
	mov ds,ax
	
start:	mov dx,offset str1
	mov ah,09
	int 21h
	
	mov ah,01
	int 21h
	cmp al,13
	je exit
	
	mov bl,al
	mov dx,offset str2
	mov ah,09
	int 21h
	
	mov cx,2

again:	rol bl,4
	mov dl,bl
	and dl,0fh
	cmp dl,9
	jbe digit
	
	add dl,7
	
digit:
	add dl,30h
	mov ah,02
	int 21h
	dec cx
	jnz again

	jmp start

exit:
	mov ah,4ch
	int 21h
	main endp
	end main
	