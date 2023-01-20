#include <iostream>
#include <stack>
#include <sstream>
#include <string>
#include "oop6.h"
using namespace std;

int convert() {
    string str;
    cout << "Vvedite vyrarzenije" << endl;
    getline(cin, str);
    istringstream s(str);
    stack<int> stack;
    int value;
    char sign;

    while (!s.eof())
    {
        while (s >> value) {
            stack.push(value);
        }
        if (!s.eof())
        {
            s.clear();
            s.unget();
            s >> sign;
            if (stack.size() < 2)
            {
                cout << "Error with operation order" << endl;
                return 0;
            }
            int right = stack.top();
            stack.pop();
            int left = stack.top();
            stack.pop();
            switch (sign)
            {
            case '+':
                stack.push(right + left);
                break;
            case '-':
                stack.push(right - left);
                break;
            case '*':
                stack.push(right * left);
                break;
            case '/':
                stack.push(right / left);
                break;
            default:
                cout << "Wrong operatop " << sign << endl;
                return 0;
            }
        }
    }
    if (stack.size() != 1)
    {
        cout << "Error with stack" << endl;
        return 0;
    }
    cout << "Result value is " << stack.top() << endl;
    return stack.top();
}