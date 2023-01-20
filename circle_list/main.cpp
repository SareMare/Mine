#include <iostream>
using namespace std;
#include "oop4.h"




int main()
{
	list first;
	first.init(5);
	first.add(1);
	first.add(1);
	first.add(1); 
	first.add(1);
	first.add(1);
	first.Print();
	first.add(2);
	first.Print();
	first.add(2);
	first.Print();
}
