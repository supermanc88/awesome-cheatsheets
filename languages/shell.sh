# shortcuts
Ctrl + LeftArrow : 将光标向前移动一个单词（Mac下为Alt）
Ctrl + RightArrow : 将光标向后移动一个单词（Mac下为Alt）
Ctrl + A : 移动光标到命令行首
Ctrl + E : 移动光标到命令行尾
Ctrl + K : 删除光标之后的所有字符
Ctrl + L : 清屏并重新显示
Ctrl + P : 上一条命令，可以一直按表示一直往前翻
Ctrl + N : 下一条命令
Ctrl + R : 历史命令中出现过的字符串，按字符串查找历史命令

# debian安装界面
apt -y install task-kde-desktop

# yum
# 更新缓存
yum makecache
# 清除yum缓存
yum clean all
# 清除缓存目录下的软件包/var/cache/yum
yum clean packages
# 显示已安装的包
yum list installed
# 列出所有可更新的软件包
yum list updates
# 列出所有已安装但不在yum repo内的软件包
yum list extras
# 列出软件包的依赖关系
yum deplist <package-name>
# 获取软件包信息
yum info <package-name>
# 下载rpm包，如果下载的包包含没有满足的依赖关系，yum会把相关的依赖包也下载，但不会安装
# 一般情况下会保存在 /var/cache/yum/x86_64/<centos-version>/<repository>/packages
yum install --downloadonly <package-name>
# 指定下载目录
yum install --downloadonly --downloaddir=<dir> <package-name>

# 修改语言
export LANG="en_US.UTF-8"
export LANG="zh_CN.UTF-8"
export LANG="zh_CN.GBK"


# 获取进程pid
ps aux | grep -v grep | awk '{print $2}'

# 杀掉所有进程
ps aux | grep <proc name> | grep -v grep | awk '{print $2}' | xargs kill -9


# awk
# 每行按空格或TAB分割，输出文本中的1、4项
awk '{print $1,$4}' log.txt
# 使用","分割
awk -F, '{print $1,$2}'   log.txt
# 使用多个分隔符.先使用空格分割，然后对分割结果再使用","分割
awk -F '[ ,]'  '{print $1,$2,$5}'   log.txt


# IFS 字段分隔符
# shell默认分隔符为 空格 制表符 换行符
# 可使用一个环境变量保存原来的分隔符，修改的分隔符使用完后，再恢复
# 换行符
IFS=$'\n'
# 多个分隔符
IFS=:;

# makefile
# = 是递归展开的，可以设置后面定义的变量，只有在变量在使用时才会展开
# := 是直接展开的
# ?= 只有此变量在之前没有赋值的情况下都会对这个变量赋值


# tar
# 压缩tar.gz，只打tar的话，就不需要z参数
tar zvcf xx.tar.gz /tmp/xxxxx
# 解压缩
tar zvxf xx.tar.gz

# Docker
# 启动容器
docker run --name=my_container -it rep:tag /bin/bash
# 端口映射
docker run --name=my_container -it -p 10022:22 -p 18080:8080 rep:tag /bin/bash

# system-uuid
dmidecode -s system-uuid

# 网络
# netstat
# 显示所有端口
netstat -a
# 显示监听端口
netstat -l
# 显示tcp监听端口
netstat -lt
# 显示udp监听端口
netstat -lu

# 防火墙
service iptables status
service iptables stop/start

firewall-cmd --state
systemctl stop firewalld.service
systemctl disable firewalld.service

# nginx
# 编译调试版本
./configure --with-debug --without-http_rewrite_module
# 在objs/Makefile中添加 -g -O0
make && make install
# nginx.conf 配置文件中添加
# daemon off;
# master_process off;

# gdb
# 设置当进程调用fork时gdb是否同时调试父子进程
set detach-on-fork on/off
# 设置当进程调用fork时是否进入子进程
set follow-fork-mode parent/child

# CentOS7修改默认启动内核
# 查看当前内核版本
uname -r
# 查看当前默认启动内核
[root@infosec ~]# grub2-editenv list
saved_entry=CentOS Linux (3.10.0-1160.76.1.el7.x86_64) 7 (Core)
# 确认系统当前已安装内核版本
cat /boot/grub2/grub.cfg | grep -v rescue | grep ^menuentry
# menuentry 'CentOS Linux 7 Rescue b25596acf71342288e5596e95af749bb (3.10.0-1160.76.1.el7.x86_64)' --class
# menuentry 'CentOS Linux (3.10.0-1160.76.1.el7.x86_64) 7 (Core)' --class centos --class gnu-linux --class
rpm -qa kernel
# kernel-3.10.0-1160.76.1.el7.x86_64
# kernel-3.10.0-957.el7.x86_64
# 设置默认启动内核
grub2-set-default 'CentOS Linux (3.10.0-693.el7.centos.toa.x86_64) 7 (Core)'
grub2-editenv list
# saved_entry=CentOS Linux (3.10.0-693.el7.centos.toa.x86_64) 7 (Core)
# menuentry 'CentOS Linux (3.10.0-957.el7.x86_64) 7 (Core)' --class centos --class gnu-linux --class


# curl 
# 使用代理
curl -x https://10.20.62.74:7893 -U chm:chm123 https://www.google.com
curl --proxy https://10.20.62.74:7893 --proxy-user chm:chm123 https://www.google.com
# 设置代理
curl -x http://10.20.62.74:7893 -U chm:chm123 www.baidu.com > /dev/null
export proxy="http://chm:chm123@10.20.62.74:7893"
export http_proxy=$proxy
export https_proxy=$proxy
export ftp_proxy=$proxy
export no_proxy="localhost, 127.0.0.1, ::1"
# 下载文件
curl -#o https://www.google.com/test.txt test.txt

# 下载proxychains
apt search proxychains4
apt install proxychains4

# 编译proxychains4
https://github.com/haad/proxychains/archive/refs/tags/proxychains-4.4.0.tar.gz
tar zvxf proxychains-4.4.0.tar.gz
cd proxychains-proxychains-4.4.0/
./configure
# 修改Makefile中的CFLAGS，把-Werror删除
make
sudo make install
cp src/proxychains.conf /etc/

# ulimit -a
#参　　数：
#  -a 　显示目前资源限制的设定。 
#  -c <core文件上限> 　设定core文件的最大值，单位为区块。 
#  -d <数据节区大小> 　程序数据节区的最大值，单位为KB。 
#  -f <文件大小> 　shell所能建立的最大文件，单位为区块。 
#  -H 　设定资源的硬性限制，也就是管理员所设下的限制。 
#  -m <内存大小> 　指定可使用内存的上限，单位为KB。 
#  -n <文件数目> 　指定同一时间最多可开启的文件数。 
#  -p <缓冲区大小> 　指定管道缓冲区的大小，单位512字节。 
#  -s <堆叠大小> 　指定堆叠的上限，单位为KB。 
#  -S 　设定资源的弹性限制。 
#  -t <CPU时间> 　指定CPU使用时间的上限，单位为秒。 
#  -u <程序数目> 　用户最多可开启的程序数目。 
#  -v <虚拟内存大小> 　指定可使用的虚拟内存上限，单位为KB。
# 开启coredump
ulimit -c
# 只对当前shell生效
ulimit -c unlimited
# core生成目录
echo "/root/hpcf-dev/core-%e-%p-%t" > /proc/sys/kernel/core_pattern
# 修改 open files
# 这只是在当前终端有效，退出之后，open files又变为默认值。
ulimit -HSn 102400

# 共享内存
# ipcs命令 用于报告Linux中进程间通信设施的状态，显示的信息包括消息列表、共享内存和信号量的信息。
# 显示共享内存
ipcs -m
# 删除共享内存 shmid
ipcrm -m <shmid>
# 删除所有共享内存
for id in $(ipcs -m | grep -v shmid | grep -v Shared | awk '{print $2}')
do
	ipcrm -m $id
done


# git
# git修改本地或远程分支名称
# 1. 先将本地分支重命名
git branch -m oldBranch newBranch
# 2. 删除远程分支
git push origin --delete oldBranch
# 3. 将重命名后的分支推到远端
git push origin newBranch
# 4. 把修改后的本地分支与远程分支关联
git branch --set-upstream-to origin/newBranch

# git初始设置
git config --global user.name "supermanc88"
git config --global user.email "supermanc88@gmail.com"


# 网络相关设置优化
echo "65535" > /proc/sys/net/core/somaxconn
echo "20000" > /proc/sys/net/core/netdev_max_backlog
echo "20000" > /proc/sys/net/ipv4/tcp_max_syn_backlog
echo "60" > /proc/sys/net/ipv4/tcp_keepalive_time
echo "10" > /proc/sys/net/ipv4/tcp_keepalive_intvl
echo "3" > /proc/sys/net/ipv4/tcp_keepalive_probes


# tmux
# ===========================================
# 新建会话
tmux new -s <session-name>
# 分离会话
tmux detach
# 查看当前所有的 Tmux 会话
tmux ls
# 接入会话
tmux attach -t <session-name>
# 杀死会话
tmux kill-session -t <session-name>
# 切换会话
tmux switch -t <session-name>
# 重命名会话
tmux rename-session -t <old-name> <new-name>
# ===========================================
# 划分窗格
# 划分上下两个窗格
tmux split-window
# 划分左右两个窗格
tmux split-window -h
# 移动光标
# 光标切换到上方窗格
tmux select-pane -U
# 光标切换到下方窗格
tmux select-pane -D
# 光标切换到左边窗格
tmux select-pane -L
# 光标切换到右边窗格
tmux select-pane -R
# 交换窗格位置
# 当前窗格上移
tmux swap-pane -U
# 当前窗格下移
tmux swap-pane -D
# ===========================================
# 新建窗口
tmux new-window
# 新建一个指定名称的窗口
tmux new-window -n <window-name>
# 切换窗口
# 切换到指定编号的窗口
tmux select-window -t <window-number>
# 切换到指定名称的窗口
tmux select-window -t <window-name>
# 关闭窗口
tmux kill-window -t <window-name>
# 重命名窗口
tmux rename-window <new-name>
# ===========================================
# 其它命令
# 列出所有快捷键，及其对应的 Tmux 命令
tmux list-keys
# 列出所有 Tmux 命令及其参数
tmux list-commands
# 列出当前所有 Tmux 会话的信息
tmux info
# 重新加载当前的 Tmux 配置
tmux source-file ~/.tmux.conf
# 快捷键
# 会话===========================================
Ctrl+b d：分离当前会话。
Ctrl+b s：列出所有会话。
Ctrl+b $：重命名当前会话。
# 窗格===========================================
Ctrl+b %：划分左右两个窗格。
Ctrl+b "："划分上下两个窗格。
Ctrl+b <arrow key>：光标切换到其他窗格。<arrow key>是指向要切换到的窗格的方向键，比如切换到下方窗格，就按方向键↓。
Ctrl+b ;：光标切换到上一个窗格。
Ctrl+b o：光标切换到下一个窗格。
Ctrl+b {：当前窗格与上一个窗格交换位置。
Ctrl+b }：当前窗格与下一个窗格交换位置。
Ctrl+b Ctrl+o：所有窗格向前移动一个位置，第一个窗格变成最后一个窗格。
Ctrl+b Alt+o：所有窗格向后移动一个位置，最后一个窗格变成第一个窗格。
Ctrl+b x：关闭当前窗格。
Ctrl+b !：将当前窗格拆分为一个独立窗口。
Ctrl+b z：当前窗格全屏显示，再使用一次会变回原来大小。
Ctrl+b Ctrl+<arrow key>：按箭头方向调整窗格大小。
Ctrl+b q：显示窗格编号。
# 窗口===========================================
Ctrl+b c：创建一个新窗口，状态栏会显示多个窗口的信息。
Ctrl+b p：切换到上一个窗口（按照状态栏上的顺序）。
Ctrl+b n：切换到下一个窗口。
Ctrl+b <number>：切换到指定编号的窗口，其中的<number>是状态栏上的窗口编号。
Ctrl+b w：从列表中选择窗口。
Ctrl+b ,：窗口重命名。
Ctrl+b &：关闭窗口。



# docker
# 使用Dockerfile创建镜像
docker build -t <repo>:<tag> .
# docker导入和导出镜像
# 镜像导入是一个复制的过程，容器导入是将当前容器变成一个新的镜像。
# docker import 可以为镜像指定新名称
# docker load 不能对载入的镜像重命名
# export 导出（import 导入）是根据容器拿到的镜像，再导入时会丢失镜像所有的历史记录和元数据信息（即仅保存容器当时的快照状态），所以无法进行回滚操作。
# 而 save 保存（load 加载）的镜像，没有丢失镜像的历史，可以回滚到之前的层（layer）。
# 导出
docker save > dockerdemo.tar dockerdemo
# 导入
docker load < dockerdemo.tar
# docker导入和导出容器
# 导出
docker export -o ./dockerdemocontainer.tar dockerdemo
# 导入
docker import dockerdemocontainer.tar dockerdemo:imp


# gdb

# signal 信号
# trap忽略信号，信号类别可通过 kill -l列出
trap '' SIGINT SIGTERM



