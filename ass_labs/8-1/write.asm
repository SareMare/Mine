PUBLIC writeFile 

.686 ; сборка инструкций для процессора Pentium Pro (только 32-разрядный MASM)

.model flat, stdcall ; определение модели памяти

option casemap : none ; задаем различия в регистрах имён и ключевых слов 

 
; использование файлов библиотек 

includelib kernel32.lib 

include C:\masm32\include\windows.inc  

include C:\masm32\include\kernel32.inc 

 

BUFFER_SIZE = 100 

 

.data ; определение данных программы

 

bytes_write		dd 0 

buffer			db BUFFER_SIZE DUP(?), 0 

filename		db "output.txt", 0	 

file_handle		dd 0 

input_handle	dd 0 

 

.code  ; основной код - описание процедур

writeFile PROC 

invoke GetStdHandle, STD_INPUT_HANDLE 

mov input_handle, eax 

invoke ReadConsole, input_handle, ADDR buffer, BUFFER_SIZE, ADDR bytes_write, 0 

invoke CreateFile, ADDR filename, GENERIC_WRITE, NULL, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL 

mov file_handle, eax 

invoke WriteFile, file_handle, ADDR buffer, BUFFER_SIZE, ADDR bytes_write, 0 

; закрывает дескриптор открытого объекта 
; дескриптор объекта 

invoke CloseHandle, file_handle 

invoke ExitProcess, 0 

writeFile ENDP 

END writeFile 