diskLoad:
    pusha
    push dx

    mov ah, 0x02 
    mov al, dh   
    mov cl, 0x02 
    mov ch, 0x00 
    mov dh, 0x00 
    
    for int 13h
    int 0x13      
    jc diskError 

    pop dx
    cmp al, dh 
    jne sectorError
    popa
    ret


diskError:
    mov bx, diskErr
    call print
    call printNl
    mov dh, ah 
    call printHex
    jmp diskLoop

sectorError:
    mov bx, sectorErr
    call print

diskLoop:
    jmp $

diskErr: db "Disk read error", 0
sectorErr: db "Incorrect number of sectors read", 0