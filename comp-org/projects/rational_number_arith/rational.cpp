#include "rational.hpp"

Rational::Rational(int a, int b)
{
	num1 = a;
	denom1 = b;
}
Rational & Rational::operator +(Rational &x)
{
	int a = num1,
		b = denom1,
		c = x.getNum1(),
		d = x.getDenom1();
	Rational *res = new Rational(a*d + b*c, b*d);

	if(res->getDenom1() == 0){
		std::cout << "Cannot divide by ZERO!  Error!" << std::endl;
		exit(-1);
	}

	return *res;
}
Rational & Rational::operator -(Rational &x)
{
	int a = num1,
		b = denom1,
		c = x.getNum1(),
		d = x.getDenom1();

	Rational *res = new Rational(a*d - b*c, b*d);

	if(res->getDenom1() == 0){
		std::cout << "Cannot divide by ZERO!  Error!" << std::endl;
		exit(-1);
	}

	return *res;
}
Rational & Rational::operator /(Rational &x)
{
	int a = num1,
		b = denom1,
		c = x.getNum1(),
		d = x.getDenom1();
	Rational *res = new Rational(a*d, b*c);

	if(res->getDenom1() == 0){
		std::cout << "Cannot divide by ZERO!  Error!" << std::endl;
		exit(-1);
	}

	return *res;
}
Rational & Rational::operator *(Rational &x)
{
	int a = num1,
		b = denom1,
		c = x.getNum1(),
		d = x.getDenom1();
	Rational *res = new Rational(a*c, b*d);

	if(res->getDenom1() == 0){
		std::cout << "Cannot divide by ZERO!  Error!" << std::endl;
		exit(-1);
	}

	return *res;
}

std::ostream & operator <<(std::ostream &o, const Rational &r)
{
	o << r.num1 << "/" << r.denom1;
	return o;
}

int Rational::setNum1(int n){ this->num1 = n; }
int Rational::setDenom1(int n){ this->denom1 = n; }

	// Getters
int Rational::getNum1(void){ return this->num1; }
int Rational::getDenom1(void){ return this->denom1; }

