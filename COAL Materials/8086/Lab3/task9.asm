.model small
.stack 100h
.data
	str1 db 'Enter Two Digits:$'
	str2 db 'Enter Operator:$'
	str3 db 'Sum is $'
	str4 db 'Difference is $'
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
	sub cl,48
	mov ah,01
	int 21h
	mov ch,al
	sub ch,48
	mov dl,10
	mov ah,02
	int 21h
	mov dl,13
	mov ah,02
	int 21h
	mov dx,offset str2
	mov ah,09
	int 21h
	mov ah,01
	int 21h
	mov bl,al
	mov dl,10
	mov ah,02
	int 21h
	mov dl,13
	mov ah,02
	int 21h
	mov bh,'-'
	cmp bl,bh
	je aa
	mov dx,offset str3
	mov ah,09
	int 21h
	
	add cl,ch
	add cl,48
	mov dl,cl
	mov ah,02
	int 21h
	jmp bb

aa:	mov dx,offset str4
	mov ah,09
	int 21h
	sub cl,ch
	add cl,48
	mov dl,cl
	mov ah,02
	int 21h

bb:	mov ah,4ch
	int 21h
main endp
end main