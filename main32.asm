[org 0x7c00]
    mov bp, 0x9000 ; set the stack
    mov sp, bp

    mov bx, bit16
    call print 

    call switch32
    jmp $

%include "bootPrint.asm"
%include "gdt.asm"
%include "print32.asm"
%include "switch32.asm"

[bits 32]
start32:
    mov ebx, bit32
    call print32
    jmp $

bit16 db "Booted in 16-bit real mode", 0
bit32 db "Loaded 32-bit protected mode", 0

times 510-($-$$) db 0
dw 0xaa55
