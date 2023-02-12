#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <sstream>
#include <chrono>
#include <cmath>
#include <cstdlib>

using namespace std;

struct Time {
public:
    int hour;
    int minute;
};

struct fio {
public:
    string name;
    string surname;
    string secName;
};

struct key : public Time, public fio {
public:
    char c;
    int num;
    key* next;

    bool operator<(const key& other) const {
        if (hour != other.hour)
            return hour < other.hour;
        else if (minute != other.minute)
            return minute < other.minute;
        else if (name != other.name)
            return name < other.name;
        else if (surname != other.surname)
            return surname < other.surname;
        else if (secName != other.secName)
            return secName < other.secName;
        else if (c != other.c)
            return c < other.c;
        else
            return num < other.num;
    }

    bool operator>(const key& other) const {
        if (hour != other.hour)
            return hour > other.hour;
        else if (minute != other.minute)
            return minute > other.minute;
        else if (name != other.name)
            return name > other.name;
        else if (surname != other.surname)
            return surname > other.surname;
        else if (secName != other.secName)
            return secName > other.secName;
        else if (c != other.c)
            return c > other.c;
        else
            return num > other.num;
    }
};

void BubbleSort(vector<key>& vec)
{
    int n = vec.size();
    for (int i = 0; i < n; i++) {
        int flag = false;
        for (int j = 0; j < (n - i - 1); j++)
        {
            if (vec[j] > vec[j + 1]) {
                flag = true;
                auto temp = vec[j];
                vec[j] = vec[j + 1];
                vec[j + 1] = temp;
            }
        }
        if (flag == false) {
            break;
        }
    }

}

int Merge(vector<key>& array, int left, int middle, int right) {
    int compare_count = 0;
    int pos_left = left;
    int pos_right = middle + 1;
    int pos_temp = 0;
    int size = right - left + 1;
    key* temp = new key[size];
    while (pos_left <= middle && pos_right <= right) {
        if (array[pos_left] > array[pos_right]) {
            temp[pos_temp] = array[pos_left];
            pos_temp++;
            pos_left++;
        }
        else {
            temp[pos_temp] = array[pos_right];
            pos_temp++;
            pos_right++;
        }
        compare_count++;
    }
    while (pos_right <= right) {
        temp[pos_temp] = array[pos_right];
        pos_temp++;
        pos_right++;
    }

    while (pos_left <= middle) {
        temp[pos_temp] = array[pos_left];
        pos_temp++;
        pos_left++;
    }
    for (pos_temp = 0; pos_temp < size; pos_temp++)
        array[left + pos_temp] = temp[pos_temp];
    delete[] temp;
    return compare_count;
}

int NaturalMerge(vector<key>& array, int start, int end) {
    int count = 0;

    if (start >= end)
        return 0;

    for (int i = 0; i < end - start; i++) {
        int middle = start;
        int right = start;
        for (middle; middle < end - 1; ++middle) {
            count++;
            if (array[middle] < array[middle + 1])
                break;
        }

        if (middle + 1 == end)
            break;
        right = middle + 1;
        for (right; right < end - 1; ++right) {
            count++;
            if (array[right] < array[right + 1])
                break;
        }
        count += Merge(array, start, middle, right);
        count += NaturalMerge(array, right, end);

    }

    return count;

}

void readKeysFromFile(const string& fileName, vector<key>& keys) {
    ifstream file(fileName);
    if (!file.is_open()) {
        cerr << "Oszibka otkrytija fajla: " << fileName << endl;
        return;
    }

    string line;
    while (getline(file, line)) {
        istringstream iss(line);
        key k;
        iss >> k.hour >> k.minute >> k.name >> k.surname >> k.secName >> k.c >> k.num;
        keys.push_back(k);
    }
    file.close();
}

void writeKeysToFile(const string& fileName, const vector<key>& keys, double duration) {
    ofstream file(fileName);
    if (!file.is_open()) {
        cerr << "Oszibka otkrytija fajla: " << fileName << endl;
        return;
    }
    file << "Vremja sortirovki: " << duration << " millisekund" << endl;
    for (const auto& key : keys) {
        file << key.hour << " " << key.minute << " " << key.name << " " << key.surname << " " << key.secName << " " << key.c << " " << key.num << endl;
    }
    file.close();
}

int main() {
    vector <key> keys;
    vector <key> keys2;
    readKeysFromFile("C:\\Users\\724an\\Desktop\\3\\3\\in1000.txt", keys);
    readKeysFromFile("C:\\Users\\724an\\Desktop\\3\\3\\in1000.txt", keys2);

    auto start = chrono::high_resolution_clock::now();
    BubbleSort(keys);
    auto stop = chrono::high_resolution_clock::now();
    auto duration = chrono::duration<double, milli>(stop - start);
    cout << "Vremja sortirovki bubblom: " << duration.count() << " millisekund" << endl;
    double dur = duration.count();
    writeKeysToFile("Uluczszennyj_bubble.txt", keys, dur);

    auto start1 = chrono::high_resolution_clock::now();
    NaturalMerge(keys2, 0, keys2.size());
    auto stop1 = chrono::high_resolution_clock::now();
    auto duration1 = chrono::duration<double, milli>(stop1 - start1);
    cout << "Vremja sortirovki NaturalMerge: " << duration1.count() << " millisekund" << endl;
    dur = duration1.count();
    writeKeysToFile("NaturalMerge.txt", keys2, dur);

    return 0;
}
