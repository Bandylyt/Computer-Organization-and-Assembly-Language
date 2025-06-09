.model small
.stack 100h
.data
	arr1 db 50 dup('$')
	arr2 db 50 dup('$')
	str1 db 10,13,'Enter Main String:$'
	str2 db 10,13,'Enter Substring:$'
	str3 db 10,13,'Not a substring$'
	str4 db 10,13,'Yes it is Substring$'
	var1 dw 1 dup(0)
	

	
.code 
	main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	mov bx,0
	mov cx,0
	lea si,arr1
	lea di,arr2
	
	lea dx,str1
	mov ah,09
	int 21h
again:	
	mov ah,01
	int 21h
	cmp al,13
	je subs
	mov [si],al
	inc si
	inc bx
	jmp again

subs:
	lea dx,str2
	mov ah,09
	int 21h

again_1:
	mov ah,01
	int 21h
	cmp al,13
	je check
	mov [di],al
	inc di
	inc cx
	jmp again_1
check:
	cmp bx,cx
	jl notsub
	cmp cx,0
	je notsub
	cmp bx,0
	je notsub
	lea si,arr1
	mov var1,cx
	inc bx
	cld
outer:	
	dec bx
	jz notsub
	mov cx,var1
	lea di,arr2
t:
	cmpsb
	jne outer
	dec cx
	jnz t
	
subs1:
	
	lea dx,str4
	mov ah,09
	int 21h
	jmp exit

notsub:
	lea dx,str3
	mov ah,09
	int 21h
	
exit:
	mov ah,4ch
	int 21h
	main endp 
end main	
	
	