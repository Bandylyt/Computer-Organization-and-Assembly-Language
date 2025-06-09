.model small
.stack 100h
.data
	str1 db 10,13,'Enter String:$'
	str2 db 'After Encoding:$'
	str3 db 10,13,'After Decoding:$'
	arr1 db 50 dup ('$')
	enctable db 65 dup (0),
		    'XQPOGHZBCADEIJUVFMNKLRSTWY',6 dup (0),'xqpoghzbcadeijuvfmnklrstwy'	
	dectable db 65 dup (0),
		    'JHIKLQEFMNTURSDCBVWXOPYAZG',6 dup (0),'jhiklqefmntursdcbvwxopyazg'
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	lea di,arr1
	lea bx,enctable
	mov cx,0
	cld
	
	lea dx,str1
	mov ah,09
	int 21h
again:
	mov ah,01
	int 21h
	cmp al,13
	je display
	xlat
	stosb
	inc cx
	jmp again
	
display:
	lea dx,str2
	mov ah,09
	int 21h
	lea dx,arr1
	mov ah,09
	int 21h
	
	lea dx,str3
	mov ah,09
	int 21h
	lea si,arr1
	lea bx,dectable
decrypt:
	lodsb 
	xlat
	mov dl,al
	mov ah,02
	int 21h
	loop decrypt
	
	mov ah,4ch
	int 21h
	main endp
	end main

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	