# shortcut
Command + H : 将窗口隐藏
Command + M : 将窗口最小化
Command + W : 关闭最前面的窗口。要关闭 App 的所有窗口，请按下 Option-Command-W
Command + Tab : 可以在活跃的应用中切换
# finder
Command + Option + space : 打开finder
Command + Shift + . : 显示隐藏文件快捷键
Command + Option + P : 显示隐藏文件路径
Command + Up Arrow : 跳转到上一级目录
Command＋[ : 相当于 back ，返回上次打开的目录
Command + Shift + G : 在finder中前往指定目录
Command + Shift + O : 在finder中打开Documents目录

Ctrl + F3 : 显示/隐藏Dock
Command + Option + D : 显示/隐藏Dock

# fusion
# 4C21U-2KK9Q-M8130-4V2QH-CF810

# 安装wine
brew tap gcenx/wine
brew install --cask --no-quarantine wine-crossover
brew install --no-quarantine gcenx/wine/unofficial-wineskin

# 修改启动台行列
# 行
defaults write com.apple.dock springboard-rows -int 6
# 列
defaults write com.apple.dock springboard-columns -int 8
killall Dock
#恢复默认
defaults write com.apple.dock springboard-rows Default
defaults write com.apple.dock springboard-columns Default
killall Dock

#开启“任何来源”的方法如下：
sudo spctl  --master-disable
# app已损坏 来自不明的开发者
sudo xattr -rd com.apple.quarantine /Applications/xxxxxx.app


# Mac显示“隐藏文件”命令：
defaults write com.apple.finder AppleShowAllFiles -bool true
# Mac隐藏“隐藏文件”命令：
defaults write com.apple.finder AppleShowAllFiles -bool false

# 已损坏，无法打开
sudo xattr -rd com.apple.quarantine /Applications/electerm.app


# smb
sudo touch /etc/nsmb.conf 
#然后输入您Mac装置的密码,此步骤必须
sudo touch /etc/nsmb.conf
#创建nsmb.conf文件,此步骤必须
sudo bash -c 'echo "[default]" >> /etc/nsmb.conf'
#写入文件抬头，此步骤必须
sudo bash -c 'echo "signing_required=no" >> /etc/nsmb.conf'
#关闭 SMB 的签章功能
echo "mc_on=no" | sudo tee -a /etc/nsmb.conf
#macOS 中完全停用 SMB 多通道支持
echo "mc_prefer_wired=yes" | sudo tee -a /etc/nsmb.conf
#优先有线连接，Wi-Fi仅用作故障转移以实现冗余
cat /etc/nsmb.conf
#查看是否添加成功


# 列出进程
