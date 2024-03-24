#include <thread>
#include <atomic>
#include <iostream>

std::atomic<int> shared_num = 0;

void func()
{
    for (int i = 0; i < 10000; i++)
    {
        shared_num += 1;
    }
}

int main(int argc, char const *argv[])
{
    std::thread t1(func);
    std::thread t2(func);
    t1.join();
    t2.join();
    shared_num.store(500);  //赋值
    std::cout << shared_num << std::endl;
    return 0;
}
