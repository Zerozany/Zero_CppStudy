#include <iostream>
#include <mutex>
#include <thread>

int x = 0;
std::mutex _mtx;

void func()
{
    for (int i = 0; i < 100000; i++)
    {
        std::lock_guard<std::mutex> lock(_mtx); //智能锁，只能在局部作用域中使用
        x += 1;
    }
}

int main(int argc, char const *argv[])
{
    std::thread t1(func);
    std::thread t2(func);
    t1.join();
    t2.join();
    std::cout << x << std::endl;
    return 0;
}
