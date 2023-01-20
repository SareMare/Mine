#include "oop2.h"
#include <string>
#include <iostream>
#include <algorithm>
using namespace std;

void Upper_Case(string& str)
{
    str[0] = (char)toupper(str[0]);
    for (int i = 0; i < str.size(); i++)
    {
        if (str[i] == ' ')
            str[i + 1] = (char)toupper(str[i + 1]);
    }
}


void Delete_Spaces(string& str)
{
    string::iterator end_pos = remove(str.begin(), str.end(), ' ');
    str.erase(end_pos, str.end());
}

string stringToHashtag(string str)
{   
    string sharp = "#";
    try
    {
        int leng = str.length();
        if ((leng <= 100) && (leng != 0))
        {
            Upper_Case(str);
            Delete_Spaces(str);    
            str = sharp + str;
            return(str);
        }
        else
            throw(leng);
    }
    catch (int sizez)
    {
        return("ERROR: Your string has more than 100 or 0 symbols. Length of your string is" + to_string(sizez));

    }
}