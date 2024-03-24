#include <iostream>
#include <functional>

void func(int &x)
{
    x += 10;
    std::cout << x << std::endl;
}

int func1(int &&x)
{
    x += 10;
    return x;
}

int func2(int x, int y, int z)
{
    std::cout << x << y << z << std::endl;
    return (x + y) * z;
}

int main(int argc, char const *argv[])
{
    // int n = 20;
    // func(n);
    // std::cout << func1(19) << std::endl;
    // auto fn = std::bind(func2, std::placeholders::_2, 20, std::placeholders::_1);
    // std::cout << fn(10, 15) << std::endl;
    std::function<void(int &)> greet = func;
    int sum = 30;
    func(sum);
    return 0;
}
