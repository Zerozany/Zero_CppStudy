#include <iostream>
#include <thread>
#include <vector>
#include <queue>
#include <functional>
#include <mutex>
#include <condition_variable>

class ThreadPool
{
public:
    // 构造函数，创建指定数量的线程
    ThreadPool(size_t numThreads) : stop(false)
    {
        for (size_t i = 0; i < numThreads; ++i)
        {
            // 每个线程都执行一个无限循环，等待任务并执行
            workers.emplace_back([this]
                                 {
                for (;;)
                {
                    std::function<void()> task;
                    {
                        std::unique_lock<std::mutex> lock(queueMutex);
                        // 线程等待直到有任务可用或者线程池停止
                        condition.wait(lock, [this] { return stop || !tasks.empty(); });
                        // 如果线程池停止且任务队列为空，则线程退出
                        if (stop && tasks.empty()) return;
                        // 从任务队列中获取任务并执行
                        task = std::move(tasks.front());
                        tasks.pop();
                    }
                    task(); // 执行任务
                } });
        }
    }

    // 向线程池添加任务
    template <class F>
    void enqueue(F &&task)
    {
        {
            std::unique_lock<std::mutex> lock(queueMutex);
            tasks.emplace(std::forward<F>(task));
        }
        condition.notify_one(); // 通知一个等待的线程开始执行任务
    }

    // 析构函数，等待所有线程结束并销毁线程
    ~ThreadPool()
    {
        {
            std::unique_lock<std::mutex> lock(queueMutex);
            stop = true; // 设置停止标志
        }
        condition.notify_all(); // 通知所有等待的线程停止
        for (std::thread &worker : workers)
        {
            worker.join(); // 等待线程结束
        }
    }

private:
    std::vector<std::thread> workers;        // 存储线程的容器
    std::queue<std::function<void()>> tasks; // 存储任务的队列
    std::mutex queueMutex;                   // 用于保护任务队列的互斥量
    std::condition_variable condition;       // 用于条件变量的条件变化通知
    bool stop;                               // 线程池停止标志
};

// 示例任务函数，打印数字
void printNumber(int number)
{
    std::cout << "Number: " << number << std::endl;
}

int main()
{
    // 创建一个具有4个线程的线程池
    ThreadPool pool(4);

    // 向线程池中添加10个任务
    for (int i = 0; i < 10; ++i)
    {
        pool.enqueue([i]
                     { printNumber(i); });
    }

    // 等待任务执行完成
    std::this_thread::sleep_for(std::chrono::seconds(1));

    return 0;
}
