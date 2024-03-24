#include <thread>
#include <iostream>

void func1()
{
    while (true)
    {
        std::cout << __func__ << "\n";
        std::cout << std::this_thread::get_id() << "\n";
        std::this_thread::sleep_for(std::chrono::milliseconds(500));
    }
}

int main(int argc, char const *argv[])
{
    std::thread t1(func1);
    std::this_thread::sleep_for(std::chrono::seconds(3));

    std::thread t2(std::move(t1));
    std::cout << t1.get_id() << "\n";
    std::this_thread::sleep_for(std::chrono::seconds(10));
    return 0;
}
