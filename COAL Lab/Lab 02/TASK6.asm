.model small
.stack 100h
.data
	
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov cl,1
bb:	mov ch,10

aa:	mov dl,'*'
	mov ah,02h
	int 21h
	dec ch
	jnz aa
	mov dl,10
	mov ah,2
	int 21h
	mov dl,13
	mov ah,2
	int 21h
	inc cl
	cmp cl,10
	jbe bb
    
	mov ah,4ch
	int 21h
main endp
end main