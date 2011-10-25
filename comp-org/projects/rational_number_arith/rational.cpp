#include "rational.hpp"

Rational::Rational(int a, int b)
{
	num1 = a;
	denom1 = b;
}
Rational & Rational::operator +(Rational &a)
{
	Rational res(a.getNum1() + num1, a.getDenom1() + denom1);
	return *this;
}
Rational & Rational::operator -(Rational &a)
{
	return a;
}
Rational & Rational::operator /(Rational &a)
{
	return a;
}
Rational & Rational::operator *(Rational &a)
{
	return a;
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

