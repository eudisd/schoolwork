#include "rational.cpp"

class Rational {
private:
	int num1 num2;
	int denom1, denom2;
	
	int numResult;
	int denomResult;
public:

	// Setters
	int getNum1(int n){ num1 = n; }
	int getNum2(int n){ num2 = n; }
	int getDenom1(int n){ denom1 = n; }
	int getDenom2(int n){ denom2 = n; }
	int getNumResult(int n){ numResult = n; }
	int getDenomResult(int n){ denomResult = n; }

	// Getters
	int getNum1(void){ return num1; }
	int getNum2(void){ return num2; }
	int getDenom1(void){ return Denom1; }
	int getDenom2(void){ return Denom2; }
	int getNumResult(void){ return numResult; }
	int getDenomResult(void){ return numDenomResult; }

};