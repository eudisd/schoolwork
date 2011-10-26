#ifndef _RATIONAL_H_
#define _RATIONAL_H_

#include <iostream>
#include <cstdlib>
#include <fstream>

class Rational {
private:
	int num1;
	int denom1;

public:

	Rational(int a, int b);
	// overloaded operators 

	Rational & operator +(Rational &x);
	Rational & operator -(Rational &x);
	Rational & operator /(Rational &x);
	Rational & operator *(Rational &x);
	friend std::ostream & operator <<( std::ostream &o, const Rational &r);

	// Setters
	int setNum1(int n);
	int setDenom1(int n);

	// Getters
	int getNum1(void);
	int getDenom1(void);

};

#endif