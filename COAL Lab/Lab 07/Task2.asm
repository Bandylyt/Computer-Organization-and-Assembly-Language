.Model Small
.Stack 100h

.data
   mystring db 10, 13, 'MyStr: $'
   chrto db 10, 13,'chr: $'
   modify db 10, 13, 'Modified String: $'

   character db 0
   mystr db 20 dup('$')

.code
    Main Proc
    Mov Ax, @data
    MOV Ds, Ax
    Mov es, Ax

    Mov di, offset mystr


    mov dx, offset mystring
    Mov ah, 09
    INT 21h

    Mov cl, 0

    cld


again:  Mov ah, 01
       int 21h
       Cmp AL, 13
       JE exit

       stosb
	   inc cl
       jmp again

exit:
    Mov bl, cl

    Mov dx, offset chrto
    Mov ah, 09
    int 21h


    Mov ah, 01
    int 21h

   Mov di, offset mystr
ag: 
   scasb
   JE loc
   dec cl
   cmp cl, 0
   je terminate
   jmp ag
   

loc:
   Mov ah, '0'
   DEC DI
   Mov [di], ah
   dec cl
   cmp cl, 0
   je terminate
   jmp ag   
   
   
   
   


terminate:  
    Mov dx, offset mystr
    mov ah, 09
    int 21h

	Mov dx, offset modify
	Mov ah, 09
	int 21h

       
       
      
    Mov di, offset mystr


tag:  Mov Dl, [di]
      cmp dl, '0'
      je ending

      Mov ah, 02
      int 21h
      dec bl
      cmp bl, 0
      je choro
      jmp tag
ending:
    inc di
    dec bl
    cmp bl ,0
    je choro
    jmp tag
choro:
    Mov Ah, 4ch 
    int 21h
Main endp 
end Main