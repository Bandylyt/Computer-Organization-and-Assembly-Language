.model small
.stack 100h
.data
    str1 db 'Enter Two Digits:$'
    str2 db 10, 13, 'Error! Sum is greater than 9.$'
    str3 db 10, 13, 'Sum is $'
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt to enter two digits
    mov dx, offset str1
    mov ah, 09h
    int 21h

    ; Read first digit
    mov ah, 01h
    int 21h
    sub al, 48      ; Convert ASCII to numerical value
    mov cl, al

    ; Read second digit
    mov ah, 01h
    int 21h
    sub al, 48      ; Convert ASCII to numerical value
    mov ch, al

    ; Sum the digits
    add cl, ch

    ; Check if sum is greater than 9
    cmp cl, 9
    ja Error

    ; Display "Sum is "
    mov dx, offset str3
    mov ah, 09h
    int 21h

    ; Display the sum
    add cl, 48      ; Convert numerical value to ASCII
    mov dl, cl
    mov ah, 02h
    int 21h
    jmp Exit

Error:
    ; Display error message
    mov dx, offset str2
    mov ah, 09h
    int 21h

Exit:
    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main
