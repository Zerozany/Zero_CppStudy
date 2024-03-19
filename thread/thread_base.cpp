#include <thread>
#include <iostream>
#include <vector>

int main(int argc, char const *argv[])
{
    std::thread t1([]
                   { std::cout << "t1_thread"
                               << "\n"; });

    std::thread t2([]
                   { std::cout << "t2_thread"
                               << "\n"; });

    std::cout << t1.joinable() << "\n";
    std::cout << t2.joinable() << "\n";
    std::thread::id t1_id = t1.get_id();
    std::thread::id t2_id = t2.get_id();
    std::cout << t1_id << "\n";
    std::cout << t2_id << "\n";
    std::this_thread::sleep_for(std::chrono::seconds(2));
    return 0;
}
