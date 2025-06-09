.model small
.stack 100h
.data
	str1 db 10,13, 'Enter a Character:$'
	str2 db 10,13, 'The ASCII code in binary is: $'
	str3 db 10,13, 'The Number of 1 bit in its ASCII code: $'
	


.code
	main proc
	mov ax,@data
	mov ds,ax
	
	mov bl,0
	mov dx,offset str1
	mov ah,09
	int 21h
	
	mov ah,01
	int 21h

	mov bl,al
	mov cl,8
	mov ch,0

	mov dx,offset str2
	mov ah,09
	int 21h

again:	rol bl,1
	jc one

	mov dl,'0'
	mov ah,02
	int 21h
	jmp bb
	
one:	
	mov dl,'1'
	mov ah,02
	int 21h
	inc ch
	
bb:	dec cl
	jnz again

	mov dx,offset str3
	mov ah,09
	int 21h
	
	add ch,48
	mov dl,ch
	mov ah,02
	int 21h
	


	mov ah,4ch
	int 21h
	main endp
	end main


		