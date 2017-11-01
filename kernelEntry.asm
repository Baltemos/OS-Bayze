[bits 32]
[extern main]
call main
mov ebx, doIHere
call print32
jmp $

%include "print32.asm"

doIHere db "fuck you", 0
