.model small
.stack 100h
.data
	str1 db 10,13,'Enter a String: $'
	str2 db 10,13,'Reverse String is: $'
	str3 db 150 dup ('$')
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov ch,0
	mov cl,0
	
	mov si,offset str3
	mov dx,offset str1	
	mov ah,09
	int 21h
	
input:
	mov ah,1
	int 21h
	cmp al,13
	je check
	mov ah,0
	cmp al,32
	je reverse
	push ax
	inc ch
	jmp input


reverse:
	pop [si]
	inc si 
	dec ch
	jnz reverse
	mov ah,32
	mov [si],ah
	inc si
	jmp input

check:
	cmp ch,0
	je exit
	jmp display

display:
	pop [si]
	inc si 
	dec ch
	jnz display
	
	mov dx,offset str2
	mov ah,9
	int 21h
	
	mov dx,offset str3
	mov ah,9
	int 21h
	
	
	
exit:	
	
	mov ah,4ch
	int 21h
	main endp
end main
	
	
	
	