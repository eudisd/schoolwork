
#include "rational.hpp"

int main(void)
{

	Rational a(1, 7), b(1, 8);
	std::cout << "My Rational Number: " << a << ", " << b << std::endl;
	std::cout << "Addition: " << (a + b) << std::endl;
	std::cout << "Subtraction: " << (a - b) << std::endl;
	std::cout << "Multiplication: " << (a * b) << std::endl;
	std::cout << "Division: " << (a / b) << std::endl;

	return 0;
}