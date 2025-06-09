.model small
.stack 100h
.data 
    str1 db 'Enter character: $'
    str2 db 10, 13, 'Output: $'
.code 
MAIN PROC

    mov ax, @data
    mov ds, ax
    
    mov dx, offset str1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    

    ; Display "Output: "
    mov dx, offset str2
    mov ah, 09h
    int 21h

    ; Prepare to display the hexadecimal value
    mov cl, 4

again: 
    rol ax, 4

    mov dl, al
    and dl, 0Fh

    cmp dl, 9
    ja  tag
    add dl, 30h
    jmp loopy

tag:
    add dl, 37h

loopy:
    ; Display the hexadecimal digit
    mov ah, 02h
    int 21h

    ; Loop to process the next nibble
    dec cl
    jnz again

    ; Exit the program
    mov ah, 4Ch
    int 21h

MAIN ENDP 
END MAIN
