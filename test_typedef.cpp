// 测试 typedef
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
	cout << "test_one的数据是：" << test_one.a << " " << test_one.b << endl;
	//cout << "NUM1的数据是：" << NUM1 << endl;
	//cout << "NUM2的数据是：" << NUM2 << endl;
	cout << "test_second的数据是：" << test_second;
	
	return 0;
}