/*在类定义之外定义成员函数*/
class computer //类定义，起到接口作用
{
private:
	char brand[20];
	float price;
public:
	void print();	//3个public 成员函数的原型声明
	void SetBrand(char *sz);
	void SetPrice(float pr);
};