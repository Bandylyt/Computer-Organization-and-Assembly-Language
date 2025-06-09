.model small
.stack 100h
.data
	str1 db 'ABCD'
	str2 db 50 dup('$')
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	lea si,str1
	lea di,str2
	mov cx,4
	rep movsb
	
	lea dx,str2
	mov ah,09
	int 21h

	mov ah,4ch
	int 21h
	main endp
	end main
	