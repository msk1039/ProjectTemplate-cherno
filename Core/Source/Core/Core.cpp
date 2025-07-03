#include "Core.h"

#include <iostream>

namespace Core {

	void PrintHelloWorld()
	{
		std::cout << "Hello World clion!\n";
		std::cin.get();

	}

	void Log(const std::string& str) {
		std::cout << str << std::endl;
	}

}