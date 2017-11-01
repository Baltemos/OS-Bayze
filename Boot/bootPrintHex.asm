printHex:
    pusha

    mov cx, 0


hexLoop:
    cmp cx, 4 ; loop 4 times
    je end
    
    mov ax, dx 
    and ax, 0x000f 
    add al, 0x30
    cmp al, 0x39
    jle step2
    add al, 7

step2:
    mov bx, hexOut + 5
    sub bx, cx
    mov [bx], al
    ror dx, 4

    add cx, 1
    jmp hexLoop

end:
    mov bx, hexOut
    call print

    popa
    ret

hexOut:
    db '0x0000', 0
