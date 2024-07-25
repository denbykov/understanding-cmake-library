#include <iostream>
#include <filesystem>

void doSomething2()
{
    std::cout << std::filesystem::current_path() << std::endl;
}
