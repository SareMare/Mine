#include <iostream>
#include <string>
#include "oop2.h"
using namespace std;

int main()
{
    
    string str;
    cout << "Vvedite stroku" << endl;
    getline(cin, str);
    cout << stringToHashtag(str) << endl;
}