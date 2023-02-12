#include <stdio.h>
#include <iostream>
using namespace std;
int main()
{
	short x, a, y1, y2;
	char s;
	cout << "Vvedite X:";
	cin >> x;
	cout << endl << "Vvedite A:";
	cin >> a;
	__asm
	{
		mov ax,x
		mov bx,x

		cmp ax,1
		jg Higher

		Lower:
		cmp ax, 0
		jge Highs
		Lows :
		neg ax
		add ax,a
		mov y1,ax
		jmp l1
		Highs :
		add ax,a
		jmp l1

		Higher:
		add ax,10

		l1:
		cmp bx,4
		jg yes
		no:
		jmp l2
		yes:
		mov bx,2

		l2:
		div bl
		mov al,0
		mov s,ah
	}
	printf("%d", s);
}