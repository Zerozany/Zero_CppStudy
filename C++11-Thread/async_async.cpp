#include <future>
#include <iostream>
#include <thread>

int x = 0;

void func()
{
    while (true)
    {
        std::cout << x << std::endl;
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
}

int main(int argc, char const *argv[])
{
    std::future<void> fu = std::async(std::launch::async, func);
    while (true)
    {
        // std::cout << "main" << std::endl;
        x += 1;
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
    return 0;
}
