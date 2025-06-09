.model small
.stack 100h
.data
	str1 db 12, 13, 'Enter a Number from (0-9): $'
	str2 db 12, 13, 'Do you want to exit (y) or (n): $''
    str3 db 12, 13, 'Sorry Yu have entered wrong character $'
    str4 db 12, 13, 'First Number is greater than Second $'
	
.code
	main proc
	mov ax,@data
	mov ds,ax
    Mov Ah, 01
    INT 21h
    MOV CL, AL
    Mov BL, '0'
    MOV DL, 13
    MOV AH, 02h
    INT 21h
    MOV DL, 10
    MOV AH, 02h
    INT 21h

AA: MOV DL, BL
    MOV AH, 02h
    INT 21h
    MOV DL, 13
    MOV AH, 02h
    INT 21h
    MOV DL, 10
    MOV AH, 02h
    INT 21h
    INC BL
    DEC CL
    CMP CL, 47
    JA AA
	mov ah,4ch
	int 21h
main endp
end main