.model small
.stack 100h

.data
    str1 db '1234$', 0        ; Input string ending with a '$' for termination
    str2 db 10, 13, 'Output: $' ; Output string for formatting
    var1 dw 0                 ; Variable to store the accumulated number

.code
    main proc
        mov ax, @data        ; Initialize data segment
        mov ds, ax

        mov si, offset str1  ; SI points to the start of str1
    
        xor cx, cx
        MOV BX, 0 
 
 
        mov dx, 4
 
     ag: mov al, [si]
        sub al, 48 
        
        add var1, ax
        
        inc si
        
        dec dx
        jnz ag     
     
     
     mov cx, var1
     mov bx, 10
     call func
     
     mov ah, 4Ch
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
