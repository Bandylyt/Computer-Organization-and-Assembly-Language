.Model Small
.Stack 100h

.data
    inputstr db 10,13,'Enter a string: $'
    inputusr db 20 dup('$')
    Outputstr db 10,13,'Modified String: $'
    chrtofind db 0
    chrtorep db 0
    str1 db 10,13,'Character to find: $'
    str2 db 10,13,'Charcter to replace: $'




.code
    Main Proc
    Mov Ax, @data
    MOV Ds, Ax
    Mov es, Ax

    Mov di, offset inputusr

    Mov dx, offset inputstr
    Mov ah, 09
    int 21h

	Mov cl, 0

again:  Mov ah, 01
       int 21h
       Cmp AL, 13
       JE exit

       stosb
	 inc cl
       jmp again

exit:
    Mov dx, offset str1
    Mov ah, 09
    int 21h

    Mov ah, 01
    int 21h

    Mov chrtofind, AL


    Mov dx, offset str2
    Mov ah, 09
    int 21h

    Mov ah, 01
    int 21h

    Mov chrtorep , AL

   ; nowwwwwwwwwwwwww


   Mov di, offset inputusr
   Mov al, chrtofind
ag: 
   scasb
   JE loc
   dec cl
   cmp cl, 0
   je terminate
   

loc:
   Mov ah, chrtorep
   Mov [di], ah
   dec cl
   cmp cl, 0
   je terminate
   jmp ag


terminate:

	 Mov dx, offset Outputstr
	Mov ah, 09
	int 21h


    Mov dx, offset inputusr
    Mov ah, 09 
    int 21h
    
 

    Mov Ah, 4ch 
    int 21h
Main endp 
end Main