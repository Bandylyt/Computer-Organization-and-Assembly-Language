.model small
.stack 100h
.data

    str1 db 'Enter Number in hex: $'
    str2 db 10,13, 'Output: $'

.code
    main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset str1
    mov ah, 09
    int 21h

    Mov cx, 4

ag: mov ah, 01
    int 21h

    cmp al, '9'
    jbe digit

    sub al, 07
digit: sub al, 30H
    shl bx, 4

    or bl, al

    dec cx
    jnz ag



   ; output comes in bx 
    mov dx, offset str2
    mov ah, 09h
    int 21h

    xor cx, cx
    MOV CX, BX
    
    XOR BX, BX

    MOV bx, 16 ; base
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
	jbe digit2
	add dx,7
digit2:
	add dx,48
	mov ah,02
	int 21h
	dec cx
	jnz display
	pop cx
	ret
	func endp
end main


	
