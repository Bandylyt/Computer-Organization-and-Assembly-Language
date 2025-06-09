.model small
.stack 100h

.data
    str1 db 'Number is: $'
    var1 dw 256d

.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset str1
    mov ah, 09h
    int 21h

    xor cx, cx
    MOV CX, var1

    MOV bx, 2 ; base
    Call func
    MOV ah, 4ch
    int 21h

main endp



	func proc
	mov ax,cx
	push cx
	mov cx,0
again:
	mov dx,0
	div bx
	push dx
	inc cx
	cmp ax,0
	je display
	jmp again

display:

	pop dx
	cmp dx,9
	jbe digit
	add dx,7
digit:
	add dx,48
	mov ah,02
	int 21h
	dec cx
	jnz display
	pop cx
	ret
	func endp
end main


	
