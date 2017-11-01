#include "../Drivers/ports.c"

void main() {
    
    
    portByteOut(0x3d4, 14); 
    int position = portByteIn(0x3d5);
    position = position << 8;

    portByteOut(0x3d4, 15); 
    position += portByteIn(0x3d5);

    int offsetFromVga = position * 2;

    
    char *vga = 0xb8000;
    vga[offsetFromVga] = 'D'; 
    vga[offsetFromVga + 1] = 0x0f; 
}
