#include <iostream>
#include <thread>
#include <atomic>
using namespace std;

void summator(int n, int* inputArray, const int size, const int numberOfThreads, atomic<int>& sumResult)
{
    for (int i = n; i < size; i += numberOfThreads) {
        sumResult += inputArray[i];
    }
}

int main()
{
    int size;
    cout << "Vvedite razmer massiva" << endl;
    cin >> size;
    int* inputArray = new int[size];
    const int numberOfThreads = 9;
    atomic<int> sumResult(0);

    for (int i = 0; i < size; i++) {
        inputArray[i] = 1;
    }

    for (int i = 0; i < numberOfThreads; i++) {
        thread t(summator, i, inputArray, size, numberOfThreads, ref(sumResult));
        t.detach();
    }

    this_thread::sleep_for(chrono::seconds(2));

    cout << sumResult << endl;
}