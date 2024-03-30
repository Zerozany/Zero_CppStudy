#include <iostream>

namespace
{
    int a = 10;
}

namespace Stella
{
    namespace host
    {
        short port = 19;
    } // namespace host
    namespace ip
    {
        const char *m_ip = "127.0.0.1";
    }
    short port = 30;
} // namespace Stella

int main(int argc, char const *argv[])
{
    using namespace Stella;
    std::cout << a << "\n";
    std::cout << host::port << "\n";
    std::cout << port << "\n";

    return 0;
}
