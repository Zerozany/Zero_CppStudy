#include <iostream>
#include <mutex>
#include <thread>

int x = 0;
std::timed_mutex _mtx;

void func()
{
    for (int i = 0; i < 3; i++)
    {
        std::unique_lock<std::timed_mutex> lock(_mtx, std::defer_lock); // 智能锁，只能在局部作用域中使用
        if (lock.try_lock_for(std::chrono::seconds(1)))
        {
            std::this_thread::sleep_for(std::chrono::seconds(4));
            x += 1;
        }
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
