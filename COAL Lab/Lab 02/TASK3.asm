.Model Small
.Stack 100h
.data
	
.Code
	Main Proc
	MOV AX, @data
	MOV DS, AX
	MOV DL, 'A'
	MOV AH, 02h
	INT 21h
	MOV AH, 4Ch
	INT 21h
Main endp
end main