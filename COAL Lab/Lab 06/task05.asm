.model small
.stack 100h

.data
    prompt_num1 db 'Enter numerator of first fraction: $'
    prompt_denom1 db 'Enter denominator of first fraction: $'
    prompt_num2 db 'Enter numerator of second fraction: $'
    prompt_denom2 db 'Enter denominator of second fraction: $'
    result_msg db 'The result is: $'
    newline db 0Dh, 0Ah, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Input first fraction numerator
    mov dx, offset prompt_num1
    mov ah, 09h
    int 21h
    call read_dec
    mov bx, ax   ; store num1 in bx

    ; Input first fraction denominator
    mov dx, offset prompt_denom1
    mov ah, 09h
    int 21h
    call read_dec
    mov cx, ax   ; store denom1 in cx

    ; Input second fraction numerator
    mov dx, offset prompt_num2
    mov ah, 09h
    int 21h
    call read_dec
    mov si, ax   ; store num2 in si

    ; Input second fraction denominator
    mov dx, offset prompt_denom2
    mov ah, 09h
    int 21h
    call read_dec
    mov di, ax   ; store denom2 in di

    ; Calculate LCM of cx (denom1) and di (denom2)
    mov ax, cx
    mov dx, di
    call find_lcm
    mov cx, ax   ; store LCM in cx

    ; Adjust numerators
    mov ax, cx
    mov bx, di
    div bx       ; ax = LCM / denom2
    mul si       ; ax = (LCM / denom2) * num2
    mov si, ax   ; store adjusted num2 in si

    mov ax, cx
    mov bx, cx
    div bx       ; ax = LCM / denom1
    mul bx       ; ax = (LCM / denom1) * num1
    add ax, si   ; add adjusted num2 to adjusted num1

    ; Output the result
    mov dx, offset newline
    mov ah, 09h
    int 21h

    mov dx, offset result_msg
    mov ah, 09h
    int 21h

    call print_dec   ; print the result numerator

    mov ah, 02h
    mov dl, '/'
    int 21h

    mov ax, cx       ; result denominator is stored in cx
    call print_dec   ; print the result denominator

    mov ah, 4Ch
    int 21h

main endp

; Read decimal input
read_dec proc
    xor cx, cx
    xor bx, bx

again:
    mov ah, 01h
    int 21h
    cmp al, 13
    je read_done
    sub al, '0'
    mov cl, al
    mov ax, bx
    mov bx, 10
    mul bx
    add ax, cx
    mov bx, ax
    jmp again

read_done:
    mov ax, bx
    ret
read_dec endp

; Print decimal number
print_dec proc
    xor cx, cx

convert_loop:
    xor dx, dx
    mov bx, 10
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne convert_loop

print_loop:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    dec cx
    jnz print_loop

    ret
print_dec endp

find_lcm proc
    ; Backup the original values
    push bx
    push di

    ; Calculate GCD of bx (denom1) and di (denom2)
    mov ax, bx       ; denom1 into AX
    mov bx, di       ; denom2 into BX
gcd_loop:
    cmp bx, 0
    je gcd_done
    xor dx, dx
    div bx           ; AX = denom1 / denom2, DX = remainder
    mov ax, bx       ; move denom2 into AX
    mov bx, dx       ; move remainder into BX
    jmp gcd_loop

gcd_done:
    mov cx, ax       ; GCD is now in AX (saved into CX)
    
    ; Calculate LCM using reduced multiplication to avoid overflow
    pop bx           ; restore original denom1 into BX
    div cx           ; denom1 / GCD, result in AX
    mul di           ; denom2 * (denom1 / GCD), result in AX
    
    ; Restore original values to registers
    pop di           ; restore original denom2 into DI
    mov bx, ax       ; store LCM into AX
    
    ret
find_lcm endp

end main
