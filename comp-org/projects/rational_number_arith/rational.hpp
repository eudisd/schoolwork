

#ifndef _RATIONAL_H_
#define _RATIONAL_H_

class Rational {
private:
	int num1, num2;
	int denom1, denom2;
	
	int numResult;
	int denomResult;

public:

	Rational(int a, int b);
	// overloaded operators 

	Rational & operator +(Rational &a);
	Rational & operator -(Rational &a);
	Rational & operator /(Rational &a);
	Rational & operator *(Rational &a);

	// Setters
	int getNum1(int n);
	int getNum2(int n);
	int getDenom1(int n);
	int getDenom2(int n);
	int getNumResult(int n);
	int getDenomResult(int n);

	// Getters
	int getNum1(void);
	int getNum2(void);
	int getDenom1(void);
	int getDenom2(void);
	int getNumResult(void);
	int getDenomResult(void);

};

#endif