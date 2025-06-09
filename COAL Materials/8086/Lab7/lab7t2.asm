.model small
.stack 100h
.386
.data
	arr1 db 100 dup('$')
	str1 db 10,13,'Enter the String:$'
	str2 db 10,13,'Sorted String is:$'

.code
    main proc
	mov ax,@data
	mov ds,ax
	mov ch,0
	mov si,offset arr1
	

	mov dx,offset str1
	mov ah,09
	int 21h
input:
	mov ah,01
	int 21h
	cmp al,13
	je sort
	inc ch
	mov [si],al
	inc si
	jmp input
	
	
sort:
	mov di,offset arr1
	mov si,offset arr1
	mov bh,ch
	mov cl,ch
	jmp start1

outer:
	mov di,offset arr1
	inc si
	dec cl
	jz display
	
start1:	
	mov ch,bh
start:	
	mov al,[si]
	mov bl,[di]
	cmp al,bl
	jb exchange
	inc di
	dec ch
	jnz start
	jmp outer

exchange:
	
	mov al,[si]
	mov bl,[di]
	mov [si],bl
	mov [di],al
	inc di
	dec ch
	jnz start
	jmp outer
	
	
	
	

display:
	mov dx,offset str2
	mov ah,09
	int 21h

	mov dx,offset arr1
	mov ah,09
	int 21h
	

mov ah,4ch
int 21h
main endp
end main


	

	