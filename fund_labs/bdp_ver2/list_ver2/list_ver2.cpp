#include <iostream>
#include <string>
#include <corecrt_malloc.h>
using namespace std;

struct list
{
	struct node
	{
		int val;
		node* next;
	};
	node* head;
	list(): head(nullptr){}
	void remove_head()
	{
		if (head)
		{
			node* p = head;
			head = p->next;
			delete p;
		}
	}

	void add(int val)
	{
		if (!head)
		{
			head = new node;
			head->val = val;
			head->next = nullptr;
		}
		else
		{
			auto temp = head;
			head = new node;
			head->val = val;
			head->next = temp;
		}
	}

	void listprint()
	{
		for (struct node* current = head; current; current = current->next)
		{
			cout << current->val << " ";
		}
		cout << endl;
	}

	int count_list()
	{
		if (head)
		{
			auto temp = head;
			int k = 1;
			while (head->next)
			{
				k++;
				head = head->next;
			}
			head = temp;
			return k;
		}
		else
			return 0;
	}
};




struct tree
{
	struct tnode
	{
		int hours;
		int minutes;
		tnode* left;
		tnode* right;
		list spisok;
	};
	tnode* root;


	tnode* search(tnode* root, int h, int m)
	{
		if (!root)
		{
			return(nullptr);
		}
		else if ((h < root->hours) || ((h == root->hours) && (m < root->minutes)))
			search(root->left, h, m);
		else if ((h > root->hours) || ((h == root->hours) && (m > root->minutes)))
			search(root->right, h, m);
		else if ((h == root->hours) && (m == root->minutes))
			return(root);
	}

	tnode* max_left_node(tnode*& root)
	{
		if (root && root->right && (root->hours <= root->right->hours) && (root->minutes < root->right->minutes))
			max_left_node(root->right);
		else if (root && root->left && (root->hours >= root->left->hours) && (root->minutes > root->left->minutes))
			max_left_node(root->left);
		else
			return(root);
	}

	void freemem(tnode* root)
	{
		if (root != nullptr)
		{
			freemem(root->left);
			freemem(root->right);
			delete root;
			root = nullptr;
		}
	}

	void addnode(tnode*& root, int h, int m)
	{
		if (!root)
		{
			root = (struct tnode*)malloc(sizeof(struct tnode));
		    root->hours = h;
		    root->minutes = m;
			root->spisok.head = nullptr;
			root->spisok.add(stoi(to_string(h) + to_string(m)));
			root->right = nullptr;
			root->left = nullptr;
		}
		else if ((h < root->hours) || ((h == root->hours) && (m < root->minutes)))
			addnode(root->left, h, m);
		else if ((h > root->hours) || ((h == root->hours) && (m > root->minutes)))
			addnode(root->right, h, m);
		else if ((h == root->hours) && (m == root->minutes))
			root->spisok.add(stoi(to_string(h) + to_string(m)));
	}

	void remove_example(tnode*& root, int h, int m)
	{
		if (root)
		{
			if ((root->hours == h) && (root->minutes == m))
			{
				if (root->spisok.count_list() == 1)
				{
					if (!root->left && !root->right)
					{
						delete root;
						root = nullptr;
					}
					else if (!root->left && root->right)
					{
						auto temp = root;
						root = root->right;
						delete temp;
					}
					else if (root->left && !root->right)
					{
						auto temp = root;
						root = root->left;
						delete temp;
					}
					else if (root->left && root->right)
					{
						tnode* temp = max_left_node(root->left);
						int ho = temp->hours;
						int mi = temp ->minutes;
						list lst = temp->spisok;
						remove_example(root, max_left_node(root->left)->hours, max_left_node(root->left)->minutes);
						root->hours = ho;
						root->minutes = mi;
						root->spisok = lst;

					}
				}
				else if (root->spisok.count_list() > 1)
				{
					root->spisok.remove_head();
				}
			}
			else if ((h < root->hours) || ((h == root->hours) && (m < root->minutes)))
				remove_example(root->left, h, m);
			else if ((h > root->hours) || ((h == root->hours) && (m > root->minutes)))
				remove_example(root->right, h, m);
		}
	}

	int count_nodes(tnode* root, int& c_r)
	{
		if (root)
		{
			c_r++;
			count_nodes(root->right, c_r);
			count_nodes(root->left, c_r);
		}
		return c_r;
	}

	void print_Tree(tnode* p, int level)
	{
		if (p != nullptr)
		{
			print_Tree(p->right, level + 1);
			for (int i = 0; i < level; i++) cout << "   ";
			cout << stoi(to_string(p->hours) + to_string(p->minutes)) << endl;
			print_Tree(p->left, level + 1);
		}
	}
};

int main()
{
	tree t1;
	t1.root = nullptr;
	t1.addnode(t1.root, 30, 10);
	t1.addnode(t1.root, 20, 10);
	t1.addnode(t1.root, 25, 10);

	t1.addnode(t1.root, 30, 10);
	t1.root->spisok.listprint();
	int a = 0;
	int b = 0;
	cout << "Right length: " << t1.count_nodes(t1.root->right, a) << endl;
	cout << "Left length: " << t1.count_nodes(t1.root->left, b) << endl;
	a = 0;
	b = 0;
	t1.print_Tree(t1.root, 10);
	t1.remove_example(t1.root, 30, 10);
	t1.root->spisok.listprint();
	t1.remove_example(t1.root, 30, 10);
	cout << "Right length: " << t1.count_nodes(t1.root->right, a) << endl;
	cout << "Left length: " << t1.count_nodes(t1.root->left, b) << endl;
	//t1.remove_example(t1.root, 1, 0);
	t1.print_Tree(t1.root, 10);

	//t1.print_Tree(t1.root, 10);
}
