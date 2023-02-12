#include <iostream>
#include <string>
#include <vector>
#include <random>
#include <fstream>

using namespace std;

struct key {
public:
    int hour;
    int minute;
    string name;
    string surname;
    string secName;
    char c;
    int num;
    key* next;
};

void generate_name(std::string& name, std::string& surname, std::string& patronymic) {
    std::mt19937 rng(std::random_device{}());
    std::uniform_int_distribution<int> dist(1, 100);

    std::string names[] = { "Danil", "Mihail", "Dmitrij", "Ivan", "Pjotr", "Maxim", "Oleg", "Denis", "Artjom", "Nikita" };
    std::string surnames[] = { "Ivanov", "Balabanov", "Reszetnev", "Bobrovskij", "Harlamov", "Nalimov", "Petrov", "Parkerov", "Popov", "Hagivagov" };
    std::string patronymics[] = { "Ivanovicz", "Maxmovicz", "Mihailovicz", "Petrovicz", "Artjomovicz", "Nikiticz", "Borisovicz", "Olegovicz", "Dmitrievicz", "Andreevicz" };

    name = names[dist(rng) % 10];
    surname = surnames[dist(rng) % 10];
    patronymic = patronymics[dist(rng) % 10];
}

std::vector<key> generate_keys(int n) {
    std::vector<key> keys;
    std::mt19937 rng(std::random_device{}());
    std::uniform_int_distribution<int> distHour(0, 24);
    std::uniform_int_distribution<int> distMinute(0, 59);
    std::uniform_int_distribution<int> dist(100, 999);
    std::uniform_int_distribution<int> distCode(100, 999);
    std::uniform_int_distribution<int> distMobile(100000, 999999);
    for (int i = 0; i < n; i++) {
        key new_key;
        new_key.c = 'A' + dist(rng) % 26;
        new_key.num = distCode(rng);
        new_key.hour = distHour(rng);
        generate_name(new_key.name, new_key.surname, new_key.secName);
        new_key.minute = distMinute(rng);
        keys.push_back(new_key);
    }
    return keys;
}

void write_keys_to_file(const std::vector<key>& keys, const std::string& file_name) {
    std::ofstream file(file_name);
    if (file.is_open()) {
        for (const auto& k : keys) {
            file << k.hour << " " << k.minute << " " << k.name << " " << k.surname << " " << k.secName << " " << k.c << " " << k.num << std::endl;
        }
        file.close();
    }
    else {
        std::cerr << "Could not open file: " << file_name << std::endl;
    }
}

int main() {
    std::vector<key> keys = generate_keys(100);
    write_keys_to_file(keys, "in100.txt");
}

