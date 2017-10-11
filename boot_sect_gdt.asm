;GDT incase you missed that
gdt_start:

gdt_null:                       ;null descriptor
    dd 0x0                      ;dubble word (4-bytes)
    dd 0x0                      ;two because the null descriptor should be 8-bytes

;code descriptor
gdt_code:                       
    dw 0xffffff                 ;limit(bits 0-15)
    dw 0x0                      ;base (bits 0-15)
    db 0x0                      ;base (bits 16-23)
    db 10010010b                ;type flags
    db 11001111b                ;flags limit
    db 0x0                      ;base (bits 24-31)

;data descriptor, essentially the same as the code exept...
gdt_data:                       
    dw 0xffffff           
    dw 0x0                    
    db 0x0                
    db 10010010b                ;<- ...different type flags
    db 11001111b               
    db 0x0                      

gdt_end:                        ;the rare logical syntax to allow for gdt descriptor to calulate size of gdt

gdt_descriptor:
    dw gdt_end - gdt_start -1   ;gdt size (actually 32bit but you define as 1 less)
    dd gdt_start                ;defines gdt start address

;constants to handle offset i.e helps tell the assembler use and handle the gdt offset
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start