#ifndef TCP_SEVER_H
#define TCP_SEVER_H
#include <iostream>
#include <arpa/inet.h>
#include <cstring>
#include <cerrno>
#include <sys/epoll.h>
#include <unistd.h>

#define RESET "\033[0m"
#define RED "\033[31m"
#define GREEN "\033[32m"
#define YELLOW "\033[33m"

constexpr uint32_t MAX_EVENTS = 16;

class TcpSever final
{
public:
    explicit TcpSever(const char *_sever_ip, uint32_t _sever_port);
    TcpSever(const TcpSever &_sever) = delete;
    TcpSever operator=(const TcpSever &_sever) = delete;
    ~TcpSever();

    void run();

private:
    bool create_socket();
    bool bind_socket();
    bool listen_socket();
    void wait_accept(int32_t _epoll_fd);
    

private:
    int32_t m_init_socket;
    int32_t m_client_socket;
    sockaddr_in m_sever_addr;
    sockaddr_in m_client_addr;
    uint32_t m_sever_port;
    const char *m_sever_ip;
    struct epoll_event m_epoll_event;
    struct epoll_event m_epoll_events[MAX_EVENTS];
    int32_t m_epoll_fd;
};

#endif
