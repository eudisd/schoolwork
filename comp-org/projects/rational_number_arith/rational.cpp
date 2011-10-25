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

int Rational::getNum1(int n){ this->num1 = n; }
int Rational::getNum2(int n){ this->num2 = n; }
int Rational::getDenom1(int n){ this->denom1 = n; }
int Rational::getDenom2(int n){ this->denom2 = n; }
int Rational::getNumResult(int n){ this->numResult = n; }
int Rational::getDenomResult(int n){ this->denomResult = n; }

	// Getters
int Rational::getNum1(void){ return this->num1; }
int Rational::getNum2(void){ return this->num2; }
int Rational::getDenom1(void){ return this->denom1; }
int Rational::getDenom2(void){ return this->denom2; }
int Rational::getNumResult(void){ return this->numResult; }
int Rational::getDenomResult(void){ return this->denomResult; }
