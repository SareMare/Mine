#include <stdio.h>
#include <iostream>
#include <bitset>
using namespace std;
int main()
{
	short a;
	__asm
	{
		mov al,11100111b
		mov dl,al
		mov bl,11110000b
		mov cl,00001111b

		and al,bl
		and dl,cl
		ror al,1
		rol dl,1

		add al,dl
		shr al,4

		mov ah,0
		mov a,ax
	}
	cout <<bitset<8>(a) << endl;
}