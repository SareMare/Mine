.386 
.model flat, stdcall 
option casemap: none 

include C:\masm32\include\windows.inc 
include C:\masm32\include\kernel32.inc 
includelib C:\masm32\lib\kernel32.lib 
include C:\masm32\include\gdi32.inc 
includelib C:\masm32\lib\gdi32.lib 
include C:\masm32\include\masm32.inc 
include C:\masm32\include\user32.inc 
includelib C:\masm32\lib\user32.lib 
includelib C:\masm32\lib\gdi32.lib 
includelib C:\masm32\lib\masm32.lib  

.data 

COORD STRUCT ;определяем координаты символьной ячейки
x WORD ? 
y WORD ? 
COORD ENDS 

Message1 db "Input string: " ;выводим сообщение на консоль 
ProjectTitle db 'Lab_7_Assembler', 0 
xyPos COORD <0, 2> 
attributes WORD  0Ah, 0Bh, 0Ch, 0Fh, 0Eh, 0Dh, 0Ah, 0Bh, 0Ch, 0Fh, 0Eh, 0Dh, 0Ah, 0Bh, 0Ch 

.code 

Main proc 
 
LOCAL InputBufer[128] :BYTE �
LOCAL hOutPut :DWORD 
LOCAL hInput :DWORD 
LOCAL nRead :DWORD 
LOCAL nWritten :DWORD 

invoke SetConsoleTitle, addr ProjectTitle 

invoke GetStdHandle, STD_OUTPUT_HANDLE 
mov hOutPut, eax 
 
invoke WriteConsole, hOutPut, addr Message1, 14, addr nWritten, 0 
 
invoke GetStdHandle, STD_INPUT_HANDLE 
mov hInput, eax 
 
invoke ReadConsole, hInput, addr InputBufer, 15, addr nRead, 0 

invoke WriteConsole, hOutPut, addr InputBufer, nRead, addr nWritten, 0 

mov edx, [xyPos] 
mov eax, nRead 
sub eax, 1 
mov nRead, eax 
mov edx, [xyPos] 

invoke WriteConsoleOutputCharacter, hOutPut, addr InputBufer, nRead, edx, addr nWritten ;копируем символы в ячейки буфера экрана консоли, начиная с указанного значения 
mov edx, [xyPos] 

invoke WriteConsoleOutputAttribute, hOutPut, addr attributes, nRead, edx, addr nWritten ;задание цвета смежных ячеек на экране 

invoke Sleep, 10000d ;задержка 

invoke ExitProcess,0 ;завершение

Main endp 

end Main
