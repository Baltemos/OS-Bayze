[org 0x7c00]
    mov bp, 0x9000 ; set the stack
    mov sp, bp

    mov bx, 16bit
    call print 

    call switch32
    jmp $

%include "bootPrint.asm"
%include "boot_sect_gdt.asm"
%include "print32.asm"
%include "switch32.asm"

[bits 32]
start32: ; after the switch we will get here
    mov ebx, 32bit
    call print32
    jmp $

16bit db "Booted in 16-bit real mode", 0
32bit db "Loaded 32-bit protected mode", 0

; bootsector
times 510-($-$$) db 0
dw 0xaa55
