#include <iostream>
#include <filesystem>

#include <my_library/my_library.h>

void doSomething2()
{
    std::cout << std::filesystem::current_path() << std::endl;
}
