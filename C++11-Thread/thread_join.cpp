#include <thread>
#include <iostream>
#include <vector>

int main(int argc, char const *argv[])
{
    // std::thread t1([]
    //             {for(int i = 0;i < 10;i++){std::cout << i << "\n";} });
    std::thread t1([]
                   {while (true) {
        std::cout << "t1"
                  << "\n";
    } });

    std::thread t2([]
                   {while (true) {
        std::cout << "t2"
                  << "\n";
    } });

    std::vector<std::thread> thread_vector{};
    thread_vector.push_back(std::move(t1));
    thread_vector.push_back(std::move(t2));

    t1.join();
    t2.join();
    std::this_thread::sleep_for(std::chrono::seconds(5));
    return 0;
}
