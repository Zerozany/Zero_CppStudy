#include <iostream>
#include <future>
#include <thread>

void func1()
{
    std::cout <<  10 << std::endl;
}

int main(int argc, char const *argv[])
{
#if 0
    std::future<int> f1 = async(std::launch::deferred, func1, 10);
    std::cout << "f1:" << f1.get() << "\n";

    std::shared_future<int> f2 = async(std::launch::deferred, func1, 7);
    std::cout << "f2:" << f2.get() << "\n";
    std::cout << "f2:" << f2.get() << "\n";
#endif
    for (int i = 0; i < 3; i++)
    {
        std::future<void> f1 = async(std::launch::async, func1);
        // std::this_thread::sleep_for(std::chrono::seconds(1));
    }

    return 0;
}
