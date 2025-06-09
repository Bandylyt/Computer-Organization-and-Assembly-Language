.model small
.stack 100h
.386
.data
	arr1 db 5 dup('?')
	str1 db 10,13,'Enter Binary Number:$'
	str2 db 10,13,'HexaDecimal of Number is:$'

.code
    main proc
	mov ax,@data
	mov ds,ax
	mov ch,5
	mov si,offset arr1
againinput:
	
	call binaryinput
	dec ch
	jnz againinput
	mov ch,5
	mov di,offset arr1

againoutput:
	
	call hexadecimaloutput
	dec ch
	jnz againoutput
	
	mov ah,4ch
	int 21h
	main endp
	

binaryinput proc
	mov dx,offset str1
	mov ah,09
	int 21h
	
	
  input:	
	mov ah,01
	int 21h
	cmp al,13
	je store
	sub al,48
	rol bl,1
	or bl,al
	jmp input
 store:
	mov [si],bl
	inc si
	xor bx,bx
	xor ax,ax
	ret
binaryinput endp



hexadecimaloutput proc

	mov dx,offset str2
	mov ah,09
	int 21h
	push cx
	mov bl,[di]
	mov cl,2

display:
		

	rol bl,4
	mov dl,bl
	and dl,0fh
	cmp dl,9
	jbe odigit
	add dl,7
odigit:	
	add dl,48
	mov ah,02
	int 21h
	dec cl
	jnz display
	inc di
	xor dx,dx
	xor bx,bx
	pop cx
	ret
hexadecimaloutput endp

end main
