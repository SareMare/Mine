#include <iostream>
#include <windows.h> 

extern "C" void readdisc(const char*, char*, char*, int);
extern "C" void write(const char*, const char*, int);

BOOL GetDriveGeometry(DISK_GEOMETRY* pdg, LPCTSTR f_name);

int main() {
    DISK_GEOMETRY pdg;                                                              // Геометрическая структура дискового устройства

    if (GetDriveGeometry(&pdg, L"\\\\.\\PhysicalDrive0"))
    {
        char* lba0_buf = new char[pdg.BytesPerSector];                              // Буфер для lba0
        char* lba1_buf = new char[pdg.BytesPerSector];                              // Буфер для lba1

        readdisc("\\\\.\\PhysicalDrive0", lba0_buf, lba1_buf, pdg.BytesPerSector);  // Читаем данные с диска
        write("lba0.txt", lba0_buf, pdg.BytesPerSector);                            // Записываем lba0 в файл lba0.txt
        write("lba1.txt", lba1_buf, pdg.BytesPerSector);                            // Записываем lba1 в файл lba1.txt

        // Выводим lba0 в шестнадцатеричном формате
        for (size_t i = 0; i < pdg.BytesPerSector; i++)
        {
            printf("%02hhX ", lba0_buf[i]);
        }
        std::cout << "\n\n";
        // Выводим lba1 в шестнадцатеричном формате
        for (size_t i = 0; i < pdg.BytesPerSector; i++)
        {
            printf("%02hhX ", lba1_buf[i]);
        }
    }
    else
        printf("GetDriveGeometry failed. Error %ld.\n", GetLastError());

    return 0;
}

BOOL GetDriveGeometry(DISK_GEOMETRY* pdg, LPCTSTR f_name)
{
    HANDLE hDevice;                         // дескриптор проверяемого устройства  
    BOOL bResult;                           // флажок результата 
    DWORD junk;                             // сбрасываем результаты 

    hDevice = CreateFile(f_name, 0, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);

    if (hDevice == INVALID_HANDLE_VALUE)    // невозможно открыть устройство 
        return (FALSE);

    bResult = DeviceIoControl(hDevice, IOCTL_DISK_GET_DRIVE_GEOMETRY, NULL, 0, pdg, sizeof(*pdg), &junk, (LPOVERLAPPED)NULL);
    CloseHandle(hDevice);

    return (bResult);
}