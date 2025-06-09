.model small
.stack 100h
.386
.data
	str1 db 10,13,'Enter an Algebraic Expression: $'
	str2 db 10,13,'Expression is Correct$'
	str3 db 10,13,'Too many right brackets,Begin again.$'
	str4 db 10,13,'Too many left brackets,Begin again.$'
	str5 db 10,13,'Type Y if you want to continue: $'
	
	
.code
	main proc
	mov ax,@data
	mov ds,ax
	
input1:	
	mov bl,0
	mov bh,0
	mov ch,0
	
	
	mov dx,offset str1
	mov ah,09
	int 21h
	
input:
	mov ah,1
	int 21h
	
	cmp al,13
	
	je display
	
	push ax	
	
	inc ch
	
	jmp input

display:
	pop ax
	cmp al,')'
	je inchigh
	cmp al, '('
	je inclow
	dec ch
	jnz display
	jmp exit
	
inclow:
	inc bl
	jmp display

inchigh:
	
	inc bh
	jmp display

exit:
	cmp bh,bl
	je correct
	jb left
	ja right
	
	
correct:
	mov dx,offset str2
	mov ah,09
	int 21h
	
	mov dx,offset str5
	mov ah,09
	int 21h
	mov ah,1
	int 21h
	cmp al,'Y'
	je input1
	jmp exat
	
	
left:
	mov dx,offset str4
	mov ah,09
	int 21h
	jmp input1
right:
	mov dx,offset str3
	mov ah,09
	int 21h
	jmp input1

exat:
	mov ah,4ch
	int 21h
	main endp
	end main
	
	
	
	
	
	
	