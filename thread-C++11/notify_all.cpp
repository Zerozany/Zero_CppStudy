#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>

std::mutex mtx;
std::condition_variable cv;
bool ready = false;

void print_id(int id)
{
    std::unique_lock<std::mutex> lck(mtx);

    cv.wait(lck, [&]
            { return ready; });

    // 等待通知后打印线程 ID
    std::cout << "Thread " << id << std::endl;
}

void go()
{
    std::unique_lock<std::mutex> lck(mtx);
    // 准备就绪，通知所有等待中的线程
    std::this_thread::sleep_for(std::chrono::seconds(3));
    ready = true;
    cv.notify_all();
}

int main()
{
    std::thread threads[10];
    // 创建10个线程
    for (int i = 0; i < 10; ++i)
    {
        threads[i] = std::thread(print_id, i);
    }

    std::cout << "10 threads ready to race...\n";
    go(); // 发送通知，开始执行

    for (auto &th : threads)
    {
        th.join();
    }

    return 0;
}
