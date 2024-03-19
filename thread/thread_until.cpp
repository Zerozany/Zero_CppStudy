#include <iostream>
#include <thread>

int main(int argc, char const *argv[])
{
    // 获取当前时间点
    auto now = std::chrono::system_clock::now();

    // 指定要休眠到的时间点：当前时间点 + 5秒
    auto wakeup_time = now + std::chrono::seconds(5);

    std::cout << "Sleeping for 5 seconds..." << std::endl;

    // 使当前线程休眠直到指定时间点
    std::this_thread::sleep_until(wakeup_time);

    std::cout << "Awake!" << std::endl;
    return 0;
}
