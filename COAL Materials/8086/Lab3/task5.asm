.model small
.stack 100h
.data
	str1 db 'Enter a Character:$'
	str2 db 'Toggled Character:$'

.code
	main proc
	mov ax,@data
	mov ds,ax
	mov dx,offset str1
	mov ah,09
	int 21h
	
	mov ah,01h
	int 21h
	mov bl,al
	mov dl,10
	mov ah,02
	int 21h
	mov dl,13
	mov ah,02h
	int 21h	
	cmp bl,'Z'
	ja aa
	add bl,32
	jmp bb
aa:	sub bl,32
bb:	mov dx,offset str2
	mov ah,09
	int 21h
	mov dl,bl
	mov ah,02
	int 21h
	
	mov ah,4ch
	int 21h
main endp
end main