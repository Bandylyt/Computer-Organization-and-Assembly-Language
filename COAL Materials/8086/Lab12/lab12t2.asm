.model small
.stack 100h
.data
	str1 db 10,13,'Enter String 1:$'
	str2 db 10,13,'Enter String 2:$'
	str3 db 10,13,'Enter Integer:$'
	str4 db 10,13,'New String is:$'
	arr1 db 70 dup('$')
	arr2 db 70 dup('$')	
	arr3 db 70 dup('$')
	var db 0
	ca1 db 0
	ca2 db 0
.code
	main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	lea si,arr1
	lea dx,str1
	mov ah,09
	int 21h
again_in1:
	mov ah,01
	int 21h
	cmp al,13
	je exit_1
	mov [si],al
	inc si
	inc ca1
	jmp again_in1
	
exit_1:
	lea si,arr2
	lea dx,str2
	mov ah,09
	int 21h

again_in2:
	mov ah,01
	int 21h
	cmp al,13
	je exit_2
	mov [si],al
	inc si
	inc ca2
	jmp again_in2
exit_2:
	lea dx,str3
	mov ah,09
	int 21h
	mov ah,01
	int 21h
	sub al,48
	mov var,al
	sub ca2,al
	
inserting:
	lea si,arr2
	lea di,arr3
	mov cl,var
again_insert:
	mov al,[si]
	mov [di],al
	inc si
	inc di
	dec cl
	jnz again_insert

	lea si,arr1
ins_c:
	mov al,[si]
	mov [di],al
	inc si
	inc di
	dec ca1
	jnz ins_c
	lea si,arr2
set_si:
	inc si
	dec var
	jnz set_si
ins_e:
	mov al,[si]
	mov [di],al
	inc si
	inc di
	dec ca2
	jnz ins_e

	lea dx,str4
	mov ah,09
	int 21h
	lea dx,arr3
	mov ah,09
	int 21h
	
	mov ah,4ch
	int 21h
	main endp
	end main
	
	
	
	
	
	
	
	
	
	
	