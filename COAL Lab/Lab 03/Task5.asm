.model small
.stack 100h
.data
	str3 db 50 dup('$')
	str1 db 'Enter a String:$'
	str2 db 10,13, 'Vowel Characters are:$'
.code
	main proc
		mov ax,@data
		mov ds,ax
		mov bl,0
		mov dx,offset str1
		mov ah,09
		int 21h
aa:		mov ah,1
		int 21h
		cmp al,13
		je exit
		cmp al,'a'
		je plus
		cmp al,'e'
		je plus
		cmp al,'i'
		je plus
		cmp al,'o'
		je plus
		cmp al,'u'
		jne aa
plus:	inc bl	
		jmp aa
exit:	mov dx,offset str2
		mov ah,09
		int 21h

		add bl,48
		mov dl,bl
		mov ah,02
		int 21h
		mov ah,4ch
		int 21h
main endp
end main
	