
#include "rational.hpp"

int main(void)
{
	Rational a(1, 0), b(1, 0);
	std::cout << "My Rational Number: " << a << ", " << b << std::endl;
	//std::cout << "Addition: " << (a + b) << std::endl;
	//std::cout << "Subtraction: " << (a - b) << std::endl;
	std::cout << "Multiplication: " << (a * b) << std::endl;
	//std::cout << "Division: " << (a / b) << std::endl;

	return 0;
}