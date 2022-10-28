# shortcut
Command + H : 将窗口隐藏
Command + M : 将窗口最小化
Command + W : 关闭最前面的窗口。要关闭 App 的所有窗口，请按下 Option-Command-W
Command + Tab : 可以在活跃的应用中切换
Command + Shift + . : 显示隐藏文件快捷键
Command + Option + P : 显示隐藏文件路径


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

# app已损坏 来自不明的开发者
sudo xattr -rd com.apple.quarantine /Applications/xxxxxx.app


# Mac显示“隐藏文件”命令：
defaults write com.apple.finder AppleShowAllFiles -bool true
# Mac隐藏“隐藏文件”命令：
defaults write com.apple.finder AppleShowAllFiles -bool false