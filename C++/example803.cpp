/*���ඨ��֮�ⶨ���Ա����example803.cpp*/
#include<iostream>
#include<cstring>
#include "example803.h" 
using namespace std;
void computer::print()	//��Ա������ʵ�֣�ע���������������ʹ��
{
	cout << "Ʒ�ƣ� " << brand << endl;
	cout << "�۸� " << price << endl;
}
void computer:: SetBrand(char *sz)
{
	strcpy_s(brand, sz);		//�ַ�������
}
void computer:: SetPrice(float pr)
{
	price = pr;
}
