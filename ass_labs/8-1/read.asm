PUBLIC readFile 

.686 ; сборка инструкций для процессора Pentium Pro (только 32-разрядный MASM)

.model flat, C ; определение модели памяти

option casemap : none ; задаем различия в регистрах имён и ключевых слов

 
 ; использование файлов библиотек 
includelib kernel32.lib 

include C:\masm32\include\windows.inc  

include C:\masm32\include\kernel32.inc 

 

BUFFER_SIZE = 100 

 

.data ; определение данных программы

handle dd 0 

bytesWritten dd 0 

bytesRead dd 0 

filename db "output.txt", 0 

text db " ", 0 

buffer db BUFFER_SIZE DUP(?), 0 

 

.code  ; основной код - описание процедур

readFile PROC 

invoke CreateFile, ADDR filename, GENERIC_WRITE, NULL, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL 

mov handle, eax 

invoke SetFilePointer, handle, 0, 0, FILE_END 

invoke WriteFile, handle, ADDR text, 3, ADDR bytesWritten, 0 

invoke SetFilePointer, handle, 0, 0, FILE_BEGIN 

invoke CloseHandle, handle 

 

invoke CreateFile, ADDR filename, GENERIC_READ, NULL, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL 

mov handle, eax 

invoke ReadFile, handle, ADDR buffer, BUFFER_SIZE, ADDR bytesRead, 0 

invoke CloseHandle, handle 

 

invoke GetStdHandle, STD_OUTPUT_HANDLE 

mov handle, eax 

invoke WriteConsole, handle, ADDR buffer, bytesRead, ADDR bytesWritten, 0 

 

invoke ExitProcess,0 

readFile ENDP 

END readFile 