#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>

std::mutex mtx;
std::condition_variable cv;
bool ready = false;

void threadFunction(int id)
{
    std::unique_lock<std::mutex> lock(mtx);
    while (!ready)
    {
        cv.wait(lock);
    }
    std::cout << "Thread " << id << " is working..." << std::endl;
}

int main()
{
    std::thread threads[5];

    // 启动线程
    for (int i = 0; i < 5; ++i)
    {
        threads[i] = std::thread(threadFunction, i + 1);
    }

    // 主线程休眠一段时间
    std::this_thread::sleep_for(std::chrono::seconds(2));

    {
        std::lock_guard<std::mutex> lock(mtx);
        ready = true;
        std::cout << "Notifying one thread to start working..." << std::endl;
    }

    // 唤醒一个等待线程
    cv.notify_one();

    // 等待所有线程结束
    for (std::thread &t : threads)
    {
        t.join();
    }

    return 0;
}
