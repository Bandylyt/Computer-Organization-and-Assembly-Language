.model small
.stack 100h
.data

.code
	main proc
	mov ax,@data
	mov ds,ax
	mov ah,01
	int 21h
	mov bl,al
	mov dl,10
	mov ah,02
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	mov dl,bl
	mov ah,02h
	int 21h
	mov ah,4ch
	int 21h
main endp
end main