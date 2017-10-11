[bits 32] 
vidMem equ 0xb8000
WoB equ 0x0f

print32:
    pusha
    mov edx, vidMem

print32loop:
    mov al, [ebx]
    mov ah, WoB

    cmp al, 0
    je print32End

    mov [edx], ax
    add ebx, 1
    add edx, 2

    jmp print32End

print32End:
    popa
    ret
