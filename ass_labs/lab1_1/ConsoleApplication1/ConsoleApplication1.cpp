#include <stdio.h>

int main()
{
	short a;
	__asm
	{
		mov ax, 12
		sub ax, 9

		mov dx, ax

		mov ax, 16
		sub ax, 9
		mov bx, 6
		div bl
		mov ah, 0
		mov cx,ax

		mov ax,dx
		mov bx,cx
		div bl
		mov ah,0
		mov dx,ax

		mov ax,3
		mov bx,2
		mul bl

		mov bx,2
		add bx,3

		div bl
		mov ah,0
		mov cx,ax

		mov ax,12
		mov bx,5
		div bl
		mov ah,0

		mul cl

		sub dx,ax
		mov ax,dx
		
		mov a, ax
	}
	printf("%d", a);
}