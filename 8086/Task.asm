.Model Small
.Stack 100h

.data
    array1 dw 55, 1000, 2000
    number dw 3
    variable dw 0
    remainder dw 0
    quoitent dw 0
    str1 db 'Output is: $'
    str2 db '.$'
.code
    main proc
    mov ax, @data
    mov ds, ax

    mov di, offset array1
    mov cx, number
ag: 
    Mov ax, [di]
    Add variable, ax
    add di, 2
    dec cx
    jnz ag


    
    Mov bx, number
    Mov ax, variable

    DIV bx
    mov quoitent, ax
    mov remainder, dx


    mov dx, offset str1
    mov ah, 09h
    int 21h

    xor cx, cx
    MOV CX, quoitent

    MOV bx, 10 
    Call func



    mov dX , offset str2
    mov ah, 09
    int 21h


    mov ax, remainder
    mov bx, 10
    mul bx




    mov dx, 0
    mov bx, number
    div bx

    xor cx, cx
    mov cx, ax

    mov bx, 10
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

