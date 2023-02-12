.686 ; сборка инструкций дл€ процессора Pentium Pro (только 32-разр€дный MASM) 

.model flat, C ; определение модели пам€ти 

 

option casemap: none ; задаем различи€ в регистрах имЄн и ключевых слов 

 

; использование файлов библиотек 

include C:\masm32\include\windows.inc  

include C:\masm32\include\kernel32.inc  

includelib kernel32.lib 

 

.Data ; определение данных программы 

 

handleFile DWORD ?  

bytesWrit DWORD ?  

 

.Code ; основной код - описание процедур 

 

Write_file proc C fileName: DWORD, fileText: DWORD, len: DWORD ; DWORD Ч 32-битное беззнаковое целое  

; выдел€ет и при необходимости инициализирует двойное слово (4 байта) хранилища дл€ каждого инициализатора 

 

; инструкци€ push помещает значение из указанного регистра в стек и уменьшает указатель стека на соответствующую величину 

push ebp  

push esp  

push eax  

 

 

mov eax, fileName  

 

; создает или открывает каталог, физический диск и т.д., возвращает дескриптор, который может быть использован дл€ доступа к объекту 

; им€ файла / режим доступа / совместный доступ / SD (дескр. защиты) / как действовать / атрибуты файла / дескр.шаблона файла 

invoke CreateFile, eax, GENERIC_WRITE, NULL, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0 

 

mov handleFile, eax  

mov ebx, fileText  

 

; пишет данные в файл с места, обозначенного указателем позиции в файле 

; дескриптор файла / буфер данных / число байтов дл€ записи / число записанных байтов / асинхронный буфер 

invoke WriteFile, handleFile, ebx, len, addr bytesWrit, 0  

 

; закрывает дескриптор открытого объекта 

; дескриптор объекта 

invoke CloseHandle, handleFile 

 

; инструкци€ pop увеличивает указатель стека, берет значение из стека и помещает его в указанный регистр 

pop eax  

pop esp  

pop ebp  

 

ret ; выполн€ет возврат из процедуры 

 

Write_file EndP  

 

End 