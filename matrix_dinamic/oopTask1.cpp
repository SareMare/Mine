#include <iostream>
#include <string>
#include <limits>
using namespace std;
#define n 3

int Multiply(int** B) //умножение ненулевых элементов
{
	int s = 1;
	for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++)
		{
			if (B[i][j] != 0)
				s = s * B[i][j];
		}
	return(s);
}
void multiple_matrix(int** A, int** B, int** BT)
{
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			A[i][j] = 0;
			for (int k = 0; k < n; k++)
				A[i][j] += B[i][k] * BT[k][j];
		}
	}
}



void transpose(int** B)
{
	int t;
	for (int i = 0; i < n; ++i)
	{
		for (int j = i; j < n; ++j)
		{
			t = B[i][j];
			B[i][j] = B[j][i];
			B[j][i] = t;
		}
	}
}

int to_5th(int a) //перевод в пятеричную систему
{
	string buffer;
	buffer.reserve(numeric_limits<int>::digits);
	do
	{
		buffer += char('0' + a % 5); // добавляем в конец
		a = a / 5;
	} while (a > 0);
	return stoi(string(buffer.crbegin(), buffer.crend())); // разворачиваем результат
}


int Search_abs(int** B) //поиск наибольшего абсолютного значения
{
	int maxi = 0;
	for (int i = 0; i < n; i++)
	{
		if (i > n / 2)
		{
			for (int j = n / 2 - 1 + i; j < n; j++)
			{
				if (abs(B[i][j]) > maxi)
					maxi = abs(B[i][j]);
			}
		}
		else
			for (int j = n - 1; j >= n - 1 - i; j--)
			{
				if (abs(B[i][j]) > maxi)
					maxi = abs(B[i][j]);
			}
	}
	return(maxi);
}

int main()
{
	int** B;
	B = new int* [n];
	for (int i = 0; i < n; i++)
		B[i] = new int[n];
	for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++)
			cin >> B[i][j];
	int** C;
	C = new int* [n];
	for (int i = 0; i < n; i++)
		C[i] = new int[n];

	int** A;
	A = new int* [n];
	for (int i = 0; i < n; i++)
		A[i] = new int[n];

	int** BT;
	BT = new int* [n];
	for (int i = 0; i < n; i++)
		BT[i] = new int[n];

	for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++)
		{
			C[i][j] = B[i][j];
			BT[i][j] = B[i][j];
		}

	for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++)
			C[i][j] = to_5th(C[i][j]);

	transpose(BT);
	multiple_matrix(A, B, BT);

	cout << "Matrica C:" << endl;
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			cout << (C[i][j]) << " ";
		}
		cout << endl;
	}

	cout << "Matrica B:" << endl;
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			cout << B[i][j] << " ";
		}
		cout << endl;
	}
	cout << "Matrica A:" << endl;
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			cout << A[i][j] << " ";
		}
		cout << endl;
	}
	cout<<Multiply(B)<<endl;
	cout << Search_abs(B) << endl;
}