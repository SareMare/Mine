#include <iostream>
#include <iterator>
#include <utility>
#include <string>

using namespace std;
struct tim
{
	int hours;
	int minutes;
	tim() { hours = 0; minutes = 0; }
};

struct fio
{
	string name_;
	string lastname;
	string otcz;
	fio() { name_ = ""; lastname = ""; otcz = ""; }
};

struct Data
{
	tim Time;
	fio name;
	char RoomLetter;
	int RoomNumber;
	Data() { Time = tim(); name = fio(); RoomLetter = 'A'; RoomNumber = 100; }
};

void SelectionSort(Data& arr)
{
	size_t siz = sizeof(arr) / sizeof(arr[0])
	for (int i = 0; i < (sizeof(arr) / sizeof(*arr)); i++)
	{
		long int minId = i;
		for (long int j = i + 1; j < fileLen; j++)
			if ((list[j].date > list[minId].date) || ((list[j].date == list[minId].date) && (list[j].fullName > list[minId].fullName)))minId = j;
		if (minId != i)
		{
			Data buffer = list[i];
			list[i] = list[minId];
			list[minId] = buffer;
		}
	}
}

int main()
{
	Data t1 = Data();
	t1.Time.hours = 8;
	t1.Time.minutes = 30;
	t1.name.name_ = "Pavel";
	t1.name.lastname = "Zinovjev";
	t1.name.lastname = "Vladimirovicz";
	t1.RoomLetter = 'D';
	t1.RoomNumber = 741;

	Data t2 = Data();
	t2.Time.hours = 10;
	t2.Time.minutes = 10;
	t2.name.name_ = "Efremov";
	t2.name.lastname = "Evgenij";
	t2.name.lastname = "Leonidovicz";
	t2.RoomLetter = 'B';
	t2.RoomNumber = 546;

	Data t3 = Data();
	t3.Time.hours = 11;
	t3.Time.minutes = 50;
	t3.name.name_ = "Rogulin";
	t3.name.lastname = "Rodion";
	t3.name.lastname = "Sergeevicz";
	t3.RoomLetter = 'C';
	t3.RoomNumber = 213;

	Data t4 = Data();
	t4.Time.hours = 13;
	t4.Time.minutes = 20;
	t4.name.name_ = "Pavel";
	t4.name.lastname = "Zinovjev";
	t4.name.lastname = "Vladimirovicz";
	t4.RoomLetter = 'D';
	t4.RoomNumber = 656;

	Data t5 = Data();
	t5.Time.hours = 13;
	t5.Time.minutes = 20;
	t5.name.name_ = "Efremov";
	t5.name.lastname = "Evgenij";
	t5.name.lastname = "Leonidovicz";
	t5.RoomLetter = 'B';
	t5.RoomNumber = 546;

	Data array[5] = { t1,t2,t3,t4,t5 };
	

}