[org 0x7c00]
kernelOffset equ 0x1000
    mov [bootDrive], dl
    mov bp, 0x9000
    mov sp, bp

    mov bx, realMsg 
    call print
    call printNl

    call loadKernel
    call switch32
    jmp $

%include "bootPrint.asm"
%include "bootPrintHex.asm"
%include "bootDisk.asm"
%include "gdt.asm"
%include "print32.asm"
%include "switch32.asm"

[bits 16]
loadKernel:
    mov bx, kernelMsg
    call print
    call printNl

    mov bx, kernelOffset
    mov dh, 2
    mov dl, [bootDrive]
    call diskLoad
    ret

[bits 32]
startPM:
    mov ebx, protMsg
    call print32
    call kernelOffset
    jmp $


bootDrive db 0
realMsg db "Started in 16-bit Real Mode", 0
protMsg db "Switched in 32-bit Protected Mode", 0
kernelMsg db "Loading kernel into memory", 0

; padding
times 510 - ($-$$) db 0
dw 0xaa55
