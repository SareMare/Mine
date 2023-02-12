.686					; ������ ����������
.MODEL FLAT, C			; ��� ������ flat � ������ ������ �

includelib kernel32.lib	; ���������� WIN API

; ��������� ������������ ��������
CreateFileA PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD
ReadFile PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD,:DWORD
WriteFile PROTO STDCALL :DWORD,:DWORD,:DWORD,:DWORD,:DWORD
CloseHandle PROTO STDCALL :DWORD

; ���������
GENERIC_WRITE						 equ 40000000h
GENERIC_READ                         equ 80000000h
FILE_SHARE_READ                      equ 1h
FILE_SHARE_WRITE                     equ 2h
CREATE_ALWAYS                        equ 2
OPEN_EXISTING                        equ 3
FILE_ATTRIBUTE_NORMAL                equ 80h
NULL                                 equ 0

.DATA
; ����������
bytes_read		dd 0
bytes_write		dd 0 
file_handle		dd 0

.CODE

readdisc PROC C filename: dword, buffer1: dword, buffer2: dword, buffer_size: dword						; ������ ��������� readdisc
invoke CreateFileA, filename, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NULL, NULL			; �������� ���������� ����������
mov file_handle, eax																					; ��������� ���������� ����� �� eax � ���������� file_handle
invoke ReadFile, file_handle, buffer1, buffer_size, ADDR bytes_read, 0									; ��������� lba0
invoke ReadFile, file_handle, buffer2, buffer_size, ADDR bytes_read, 0									; ��������� lba1
invoke CloseHandle, file_handle																			; ��������� ���������� �����
ret																										; �������� ���������� ���������� ���������
readdisc ENDP																							; ����� ��������� readdisc

write PROC C filename: dword, buffer: dword, buffer_size: dword											; ��������� ��������� write
invoke CreateFileA, filename, GENERIC_WRITE, NULL, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL		; ��������� ���� ��� ������
mov file_handle, eax																					; ��������� ���������� ����� �� eax � ���������� file_handle
invoke WriteFile, file_handle, buffer, buffer_size, ADDR bytes_write, 0									; ���������� � ���� ������
invoke CloseHandle, file_handle																			; ��������� ���������� �����
ret																										; �������� ���������� ���������� ���������
write ENDP																								; ����� ���������� ��������� write

END