.model small
.stack 100h
.386
.data
	str1 db 10,13,'Enter an  expression: $'
	str2 db 10,13,'expression is Correct$'
	str3 db 10,13,'too many right brackets,Begin again.$'
	str4 db 10,13,'too many left brackets,Begin again.$'
	str5 db 10,13,'type Y if you want to enter: $'
	
	
.code
	main proc
	mov ax,@data
	mov ds,ax
	
input1:	
	
	mov ch,1
	mov dx,offset str1
	mov ah,09
	int 21h
	
input:
	mov ah,1
	int 21h
	cmp al,13
	je display
        cmp al,'('
        je  push1

	cmp al,')'
        je pop1
        jmp input
      pop1: pop ax
             dec ch
            
            jmp input
      



push1 : push ax	
	inc ch
	jmp input

display:
       cmp ch,0
       je correct
	pop ax
	cmp al,')'
	je right
	cmp al, '('
	je left
	
	
	

	
	
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
	jmp exit1
	
	

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

exit1:
	mov ah,4ch
	int 21h
	main endp
	end main
	
	
	
	
	
	
	