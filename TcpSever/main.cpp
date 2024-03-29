#include "TcpSever.h"

int main(int argc, char const *argv[])
{
    if (argc < 3)
    {
        std::cerr << RED << "Usage: " << argv[0] << " <server_ip> <server_port>" << RESET << std::endl;
        return 1;
    }
    TcpSever sever(argv[1], std::atoi(argv[2]));
    sever.run();
    return 0;
}
