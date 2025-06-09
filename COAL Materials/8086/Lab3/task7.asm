.model small
.stack 100h
.data

.code
	main proc
	mov ax,@data
	mov ds,ax
	mov dl,'?'
	mov ah,02
	int 21h
	mov ah,01
	int 21h
	mov cl,al
	mov ah,01
	int 21h
	mov ch,al
	mov dl,10
	mov ah,02
	int 21h
	mov dl,13
	cmp cl,ch
	ja aa
	mov dl,cl
	int 21h
	mov dl,ch
	int 21h
	jmp bb
	
aa:	mov dl,ch
	int 21h
	mov dl,cl
	int 21h
	
bb:	mov ah,4ch
	int 21h
main endp
end main