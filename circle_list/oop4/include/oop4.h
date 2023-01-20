#pragma once
#include <iostream>
using namespace std;

class list
{
	struct node
	{
		int value;
		struct node* next;
		struct node* prev;
	};

	private:
		node* head;
		node* tail;
	public:
		void init(int length);
		void add(int val);
		void Print();

};