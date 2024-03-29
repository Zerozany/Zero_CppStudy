#include "TcpSever.h"

TcpSever::TcpSever(const char *_sever_ip, uint32_t _sever_port) : m_sever_ip(_sever_ip), m_sever_port(_sever_port)
{
    create_socket();
    bind_socket();
    listen_socket();
    this->m_epoll_fd = epoll_create(1);
    if (m_epoll_fd == -1)
    {
        std::cout << RED << strerror(errno) << RESET << std::endl;
        return;
    }
    this->m_epoll_event.events = EPOLLIN;
    this->m_epoll_event.data.fd = m_init_socket;
    if (epoll_ctl(m_epoll_fd, EPOLL_CTL_ADD, m_init_socket, &m_epoll_event) == -1)
    {
        std::cout << RED << strerror(errno) << RESET << std::endl;
        close(m_epoll_fd);
        return;
    }
}

TcpSever::~TcpSever()
{
    close(m_epoll_fd);
}

void TcpSever::run()
{
    std::cout << "Waitting connect...." << std::endl;
    while (true)
    {
        uint32_t epoll_fds = epoll_wait(m_epoll_fd, m_epoll_events, MAX_EVENTS, -1);
        if (epoll_fds == -1)
        {
            std::cout << RED << strerror(errno) << RESET << std::endl;
            break;
        }
        else
        {
            std::cout << "就绪的文件描述符数量:" << epoll_fds << std::endl;
            for (int i = 0; i < epoll_fds; i++)
            {
                if (m_epoll_events[i].data.fd == m_init_socket)
                {
                    wait_accept(m_epoll_fd);
                }
                else
                {
                    std::cout << "read and write...." << std::endl;
                }
            }
        }
    }
}

bool TcpSever::create_socket()
{
    bool flag{};
    do
    {
        m_init_socket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
        if (m_init_socket == -1)
        {
            std::cout << RED << strerror(errno) << RESET << std::endl;
            flag = false;
        }
        else
        {
            std::cout << GREEN << "Create Socket Successfully" << RESET << std::endl;
            int opt = 1;
            if ((setsockopt(m_init_socket, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt))) == -1)
            {
                std::cout << YELLOW << strerror(errno) << RESET << std::endl;
            }
            else
            {
                std::cout << "Socket Status is Reuseaddred" << std::endl;
            }
            if ((setsockopt(m_init_socket, SOL_SOCKET, SO_REUSEPORT, &opt, sizeof(opt))) == -1)
            {
                std::cout << YELLOW << strerror(errno) << RESET << std::endl;
            }
            else
            {
                std::cout << "Socket Status is Reuseported" << std::endl;
            }
            flag = true;
        }
    } while (false);
    return flag;
}

bool TcpSever::bind_socket()
{
    bool flag{};
    do
    {
        m_sever_addr.sin_family = AF_INET;
        m_sever_addr.sin_port = htons(m_sever_port);
        if (inet_pton(AF_INET, m_sever_ip, &m_sever_addr.sin_addr.s_addr) == -1)
        {
            std::cout << RED << strerror(errno) << RESET << std::endl;
            flag = false;
        }
        else
        {
            if (bind(m_init_socket, (sockaddr *)&m_sever_addr, sizeof(m_sever_addr)) == -1)
            {
                std::cout << RED << strerror(errno) << RESET << std::endl;
                flag = false;
            }
            else
            {
                std::cout << GREEN << "Bind Socket Successfully" << RESET << std::endl;
            }
        }
    } while (false);
    return flag;
}

bool TcpSever::listen_socket()
{
    if ((listen(m_init_socket, 8)) == -1)
    {
        std::cout << RED << strerror(errno) << RESET << std::endl;
        return false;
    }
    else
    {
        std::cout << GREEN << "Listen Socket Successfully" << RESET << std::endl;
        return true;
    }
}

void TcpSever::wait_accept(int32_t _epoll_fd)
{
    socklen_t client_addr_len = sizeof(m_client_addr);
    m_client_socket = accept(m_init_socket, reinterpret_cast<sockaddr *>(&m_client_addr), &client_addr_len);
    if (m_client_socket == -1)
    {
        std::cout << RED << strerror(errno) << RESET << std::endl;
        return;
    }
    else
    {
        epoll_event event;
        event.events = EPOLLIN;
        event.data.fd = m_client_socket;
        if ((epoll_ctl(m_epoll_fd, EPOLL_CTL_ADD, m_client_socket, &event)) == -1)
        {
            std::cout << RED << strerror(errno) << RESET << std::endl;
            close(m_client_socket);
            return;
        }
        else
        {
            char client_ip[15];
            std::cout << "用户(" << inet_ntop(AF_INET, &m_client_addr.sin_addr.s_addr, client_ip, sizeof(client_ip)) << ":"
                      << ntohs(m_client_addr.sin_port) << ")已连接至服务器" << std::endl;
        }
    }
}
