.model small
.stack 100h
.data

.code 
    Main proc 
    MOV ax, @data
    Mov ds, ax
    MOV AX, 000Ah
    MOV BX, 000Bh
    CALL F1
    MOV AH, 4Ch
    INT 21h
main endp
    F1 proc
    PUSH AX
    PUSH BX
    XOR DX, DX
AG: CMP BX, 0001
    JZ AA
    ADD DX, AX
AA: SHL AX, 1
    SHR BX, 1
    JNZ AG
    POP BX
    POP AX
    RET
F1 endp
end main