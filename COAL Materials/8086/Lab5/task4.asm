.model small
.stack 100h
.386
.data
	str1 db 10,13, 'Enter a binary Number:$'
	str2 db 10,13, 'In HEX it is: $'
	str3 db 10,13, 'Illegal binary Number $'
	
	


.code
	main proc
	mov ax,@data
	mov ds,ax
	mov bx,0
	mov ch,0
	
	
correct:
	mov dx,offset str1
	mov ah,09
	int 21h
	
	
input:	
	mov ah,01
	int 21h
	cmp al,49
	jg invalid
	cmp al,13
	je display
	inc ch
	sub al,30h
	shl bx,1
	or bl,al	
	jmp input
	
display:
	cmp ch,8
	je two
	cmp ch,4
	je one
	cmp ch,12
	je three
	cmp ch,16
	jmp four
	


one:	mov cl,1
	jmp again


four:	mov cl,4
	jmp again

three:	mov cl,3
	jmp again


two:	mov cl,2
	


	
	

	
again:	
	rol bl,4
	mov dl,bl
	and dl,0fh
	cmp dl,9
	jbe digit
	
	add dl,7
	
digit:
	add dl,30h
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
	