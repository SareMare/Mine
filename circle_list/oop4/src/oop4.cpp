#include <iostream>
#include "oop4.h"
using namespace std;



		void list::init(int length)
		{
			head = new node;
			node* current = head;

			for (int i = 0; i < length - 1; i++)
			{
				current->next = new node;
				current = current->next;
			}
			tail = current;
			tail->next = head;
		}

		void list::add(int val)
		{
			head->value = val;
			head = head->next;
		}

		void list::Print()
		{
			cout << head->value << " ";
			node* current = head->next;
			while (current != head)
			{
				cout << current->value << " ";
				current = current->next;
			}
			cout << endl;
		}