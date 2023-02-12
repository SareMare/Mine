#include <stdio.h>
#include <iostream>
#include <bitset>
using namespace std;
int main()
{
	short a;
	__asm
	{
		mov al, 00001001b
		xor al, 11111111b //11110110
		shl al, 3 //10110000
		mov ah, 0
		mov a, ax
	}
	cout << bitset<8>(a) << endl;
	//cout << a << endl;
}