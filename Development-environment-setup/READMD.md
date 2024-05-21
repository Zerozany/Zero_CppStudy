# 开发环境搭建
***
## VS CODE：C/C++ 开发环境搭建
**CODE插件：**  
* C/C++
* C/C++ Extension Pack
* C/C++ Themes
* Chinese
* Arm Assembly          *汇编*
* CMake 
* CMake Tools
* Include Autocomplate  *头文件补全*
* Markdown All in One
* Markdown PDF
* One Dark Pro          *code主题*
* Rainbow Brackets      *彩虹花括号*
* Tabnine AI Autocomplete & ...
* Vim  
## Ubuntu：开发环境搭建
### 安装常规VIM  
1. 卸载 vim-tiny  
   > **sudo apt-get remove vim-common**
2. 下载 vim-full
   > **sudo apt-get install vim**
### 初始化 scp
*清理scp遗留ip，以便使用scp命令*
> 1. **进入Windows终端**  
> 2. **输入 ssh-keygen -R XXX.XXX.XXX.XXX**  
> 3. **XXX... 为之前连接时的ip**
### 允许 root 用户登录 ssh  
> 1. **vim /etc/ssh/sshd_config**  
> 2. **修改配置：PermitRootLogin yes**
### 启动 ssh
> 1. **sudo service ssh start**
> 2. **如果提示：failed to start ssh.     service:unit ssh.service not found**  
> >  输入：  
> >  1. sudo apt-get update  
> >  2. sudo apt-get install openssh-server   
> 3. **再次开启：sudo systemctl start ssh**
### 安装 plasma-discover
> 1. **sudo apt-get update**
> 2. **sudo apt-get install plasma-discover**


