#include <iostream>
#include <unistd.h>
#include <fcntl.h>
#include <cstring>

int main()
{
    int fd = 0;

    // 将文件描述符设置为非阻塞模式
    int flags = fcntl(fd, F_GETFL, 0);
    if (flags == -1)
    {
        std::cerr << "Failed to get file descriptor flags\n";
        close(fd);
        return 1;
    }

    flags |= O_NONBLOCK;
    if (fcntl(fd, F_SETFL, flags) == -1)
    {
        std::cerr << "Failed to set file descriptor to non-blocking mode\n";
        close(fd);
        return 1;
    }

    while (true)
    {
        // 非阻塞读操作
        char buffer[1024];
        ssize_t bytes_read = read(fd, buffer, sizeof(buffer));
        if (bytes_read == -1)
        {
            if (errno == EAGAIN || errno == EWOULDBLOCK)
            {
                std::cerr << "Read operation would block\n";
            }
            else
            {
                std::cerr << "Failed to read from file\n";
            }
        }
        else
        {
            buffer[bytes_read] = '\0'; // Add null terminator to make it a valid C-string
            std::cout << "Read " << bytes_read << " bytes from file: " << buffer << std::endl;
        }
    }

    close(fd);
    return 0;
}
