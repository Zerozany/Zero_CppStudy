#include <iostream>
#include <thread>
#include <mutex>

std::once_flag once;

void func(int num)
{
    std::cout << num << __FUNCTION__ << std::endl;
}

void function(int num)
{
    std::call_once(once, func, num);
    std::cout << num << ":Do something." << std::endl; 
}

int main(int argc, char const *argv[])
{
    std::thread t1(function, 1);
    std::thread t2(function, 2);
    std::thread t3(function, 3);
    std::thread t4(function, 4);
    t1.join();
    t2.join();
    t3.join();
    t4.join();
    return 0;
}
