/*在类定义之外定义成员函数example803.cpp*/
#include<iostream>
#include<cstring>
#include "example803.h" 
using namespace std;
void computer::print()	//成员函数的实现，注意作用域操作符的使用
{
	cout << "品牌： " << brand << endl;
	cout << "价格： " << price << endl;
}
void computer:: SetBrand(char *sz)
{
	strcpy_s(brand, sz);		//字符串复制
}
void computer:: SetPrice(float pr)
{
	price = pr;
}
