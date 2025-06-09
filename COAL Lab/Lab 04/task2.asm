.model small
.stack 100h
.data
	str1 db 10,13, 'Enter a Character:$'
	str2 db 10,13, 'The ASCII code in Hex: $'
.386
.code
	main proc
	mov ax,@data
	mov ds,ax
	
	mov bl,0
aa:	mov dx,offset str1
	mov ah,09
	int 21h
	
	mov ah,01
	int 21h
    cmp al, 13
    je ending
    mov dx,offset str2
	mov ah,09
	int 21h

	mov bl,al
	mov ch,2

again:   ROL Bl, 4
    MOV DL,bl 
    and dl, 0Fh
    cmp dl, 9
    JA letter

    add dl, 48
    jmp print

letter: ADD dl, 55
print: Mov ah, 02
    int 21h
    dec ch 
    jnz again

    jmp aa
ending:	mov ah,4ch
	int 21h
	main endp
	end main


		