// ���� typedef
#include <iostream>
using namespace std;\

int main()
{
	struct test1
	{
		int a;
		float b;
	};
	
	test1 test_one;
	test_one.a = 10;
	test_one.b = 9.85;
	
	#define NUM1 100;
	//typedef 99 NUM2;
	
	typedef struct test2
	{
		int a;
		float b;
	}
	test2_1;
	test2_1 test_second;
	test_second.a = 9;
	test_second.b = 8.98;
	cout << "test_one�������ǣ�" << test_one.a << " " << test_one.b << endl;
	//cout << "NUM1�������ǣ�" << NUM1 << endl;
	//cout << "NUM2�������ǣ�" << NUM2 << endl;
	cout << "test_second�������ǣ�" << test_second;
	
	return 0;
}