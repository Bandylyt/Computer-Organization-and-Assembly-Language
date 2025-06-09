.model small
.stack 100h
.data
	str1 db 10,13, 'Enter Binary Number:$'
	str2 db 10,13, 'Sum is:$'
	var1 db 0
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov cl,2
	

next: 
	mov bl,0
	mov dx,offset str1
	mov ah,09
	int 21h
	mov dl,9
again:
	dec dl
	jz sum
	mov ah,01
	int 21h
	cmp al,13
	je sum
	sub al,30h
	shl bl,1
	OR bl,al
	
	jmp again
sum:
	add var1,bl
	dec cl
	jnz next

	mov dx,offset str2
	mov ah,09
	int 21h
	
	mov cl,8
	jc one
	jmp again2
one:
	mov dl,49
	mov ah,02
	int 21h
	

again2:	
	
	rol var1,1
	mov dl,var1	
	and dl,01h
	add dl,48
	mov ah,02
	int 21h
	dec cl
	jnz again2
	
	
	mov ah,4ch
	int 21h
	main endp
	end main