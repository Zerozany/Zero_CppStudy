#include <iostream>
#include <thread>

int main(int argc, char const *argv[])
{
    std::thread t1([]()
                   {for(int i = 0;i < 10 ;i++){
    std::this_thread::sleep_for(std::chrono::seconds(1));

    } });
    std::thread t2([]()
                   {for(int i = 0;i < 10 ;i++){
    std::this_thread::sleep_for(std::chrono::seconds(1));

    } });
    std::cout << "t1.get_id():" << t1.get_id() << "\n";
    std::cout << "t2.get_id():" << t2.get_id() << "\n";
    std::swap(t1, t2);
    std::cout << "t1.get_id():" << t1.get_id() << "\n";
    std::cout << "t2.get_id():" << t2.get_id() << "\n";

    std::this_thread::sleep_for(std::chrono::seconds(3));
    // 处理器核心数目
    std::cout << std::thread::hardware_concurrency() << std::endl;
    return 0;
}
