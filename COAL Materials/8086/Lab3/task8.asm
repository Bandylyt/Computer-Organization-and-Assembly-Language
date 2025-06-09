.model small
.stack 100h
.data
	str1 db 'Enter Two Digits:$'
	str2 db 'Error! Sum is greater than 9.$'
	str3 db 'Sum is $'
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov dx,offset str1
	mov ah,09
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
	
	
	add cl,ch
	sub cl,96
	cmp cl,9
	ja aa
	mov dx,offset str3
	mov ah,09
	int 21h
	add cl,48
	mov dl,cl
	mov ah,02
	int 21h
	jmp bb
aa:	mov dx,offset str2
	mov ah,09
	int 21h
	

bb:	mov ah,4ch
	int 21h
main endp
end main