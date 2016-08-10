#include "example803.h"
#include <iostream>
using namespace std;
int main()
{
	computer com1;
	char brand[30] = "Lenovo";
	com1.SetBrand(brand);
	com1.SetPrice(3100);
	com1.print();
	cin >> brand;
	return 0;
}