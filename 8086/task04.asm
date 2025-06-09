	
.model small
.stack 100h

.data
    arr1 db 50 dup(?)
    arr2 db 50 dup(?)
    arr3 db 50 dup(?)
    var1 db  0
    var2 db  0
    var3 db 0
    str1 db 10,13, 'Enter  String 1:$'
    str2 db 10,13, 'Enter String 2:$'
    str3 db 10,13, 'Enter Number:$'
    str4 db 10,13, 'New String:$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si,offset arr1
    mov di,offset arr2
    
    mov dx, offset str1
     mov ah, 09h
     int 21h

 again1:    mov ah,01
            int 21h
            cmp al,13
            je  input2
            mov [si],al
            inc si
            inc var1
            
            jmp again1

  input2:  mov dx, offset str2
           mov ah, 09h
           int 21h
   
 input1:    mov ah,01
            int 21h
            cmp al,13
            je  num1
            mov [di],al
            inc di
            inc var2
            jmp input1
            
    
num1:     mov dx, offset str3
           mov ah, 09h
           int 21h
           mov ah,01
           int 21h
           sub al,48
           mov ch,al

    mov si,offset arr1
    mov di,offset arr2
    mov bx,offset arr3
   
 gain1:   mov cl,[si]
          mov [bx],cl
          inc si
          inc bx
          inc var3
          dec var1
          dec ch
          jnz gain1
  
  gain2:  mov cl,[di]
          mov [bx],cl
          inc di
          inc var3
          inc bx
          dec var2
          jnz gain2
  

  gain3:  mov cl,[si]
          mov [bx],cl
          inc si
          inc var3
          inc bx
          dec var1
          jnz gain3

    
exit:  mov dx, offset str4
     mov ah, 09h
     int 21h
  

  mov si,offset arr3
print:  mov dl,[si]
  mov ah,02
  int 21h
  inc si
  dec var3
 jnz print

mov ah,4ch
int 21h
main endp

end main


	
