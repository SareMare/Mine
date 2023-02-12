#include <corecrt_malloc.h>
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
using namespace std;
struct node
{
	int field;
	struct node* next; 
	struct node* prev;
	int count;
};

struct list
{
	struct node* head;
	struct node* tail;
};

struct list* add_node(struct list* list, int value)
{
	struct node* tmp = (struct node*)malloc(sizeof(struct node));
	tmp->field = value;
	tmp->count = 1;
	tmp->next = nullptr;

	if (list->head == nullptr)
	{
		list->head = tmp;
		list->tail = tmp;
	}
	else
	{
		struct node* c = list->head;
		while ((c->next != nullptr) and (c->field != value))
		{
			c = c->next;
		}
		if (c->field == value)
		{
			c->count = c->count + 1;
		}
		else if (c->next == nullptr)
		{
			tmp->next = list->head;
			list->head->prev = tmp;
			list->head = tmp;
		}
	}
	return(list);
}

struct list* del(struct list* list, int value)
{
	auto c = list->head;
	if (c != nullptr)
	{

		while ((c->next != nullptr) and (c->field != value))
			c = c->next;

		if (c->field == value)
		{
			if (c->prev != nullptr)
				c->prev->next = c->next;
			if (c->next != nullptr)
				c->next->prev = c->prev;
			free(c);
		}
	}
	return(list);
}

struct list* freememe(list* lst)
{
	if(lst->head != nullptr)
		while (lst->head != nullptr)
		{
			auto tmp = lst->head;
			lst->head = lst->head->next;
			free(tmp);
		}
	return(lst);
}

void listprint_pre(list* lst)
{
	for (struct node* current = lst->head; current; current = current->next)
	{
		printf("%d ", current->field);
	}
	cout << endl;
}

void listprint_post(list* lst)
{
	for (struct node* current = lst->tail; current; current = current->prev)
	{
		printf("%d ", current->field);
	}
	cout << endl;
}

bool search(list* lst, int a)
{
	if (lst->head != nullptr)
	{
		auto current = lst->head;
		while (current->next != nullptr && current->field != a)
		{
			current = current->next;
		}
		if (current->field == a)
			return(true);
	}
	else
		return false;
	
}

struct list* Peres(list* st1, list* nd2, list* finall)
{
	list* st,* nd;
	st = st1;
	nd = nd2;
	for (struct node* current1 = st1->head; current1; current1 = current1->next)
	{
		for (struct node* current2 = nd2->head; current2; current2 = current2->next)
		{
			if (current1->field == current2->field)
			{
				add_node(finall, current2->field);
				finall->head->count = current1->count + current2->count - finall->head->count;
			}
		}
	}
	return(finall);

}

int main()
{
	struct list lst = { NULL, NULL };
	struct list lst2 = { NULL, NULL };
	struct list lst3 = { NULL, NULL };

	cout << search(&lst, 1) << endl;
	for (int i = 0; i < 7; i++)
	{
		add_node(&lst, i);
	}
	for (int i = 4; i < 8; i++)
	{
		add_node(&lst2, i);
	}
	cout << search(&lst, 1) << endl;
	listprint_pre(&lst);
	listprint_pre(&lst2);
	Peres(&lst, &lst2, &lst3);
	listprint_pre(&lst3);
	listprint_pre(&lst);
	del(&lst, 4);
	listprint_pre(&lst);
	freememe(&lst);
	listprint_pre(&lst);

}