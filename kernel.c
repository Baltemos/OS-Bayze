void _start(){
}

void main(){
	char* vidMem = (char*) 0xb8000;
	*vidMem = 'X';
}
