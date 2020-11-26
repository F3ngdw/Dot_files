#!/bin/bash

cd ~

# 安装tmux
if [ `tmux -v` ]; then
    echo "tmux already installed"
else
    echo "install tmux ..."
    yum install -y tmux
fi

# 安装nvim
if [ `nvim -v` ]; then
    echo "nvim already installed"
else
    echo "install nvim ..."
    yum install -y neovim
fi

# nvim配置文件
if [ ! -e ~/.config/nvim ]; then
    echo "mkdir ~/.config/nvim"
    mkdir -p ~/.config/nvim
else
    echo "~/.config/nvim already exists"
    if [ -e ~/.config/nvim/init.vim ]; then
        echo "init.vim already exists. cp init.vim.bak"
        cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak
fi
echo "ln -s ~/Dot_files/init.vim ~/.config/nvim/init.vim ..."
ln -s ~/Dot_files/init.vim ~/.config/nvim/init.vim

echo "ln -s ~/Dot_files/coc-settings.json ~/.config/nvim/coc-settings.json"
ln -s ~/Dot_files/coc-settings.json ~/.config/nvim/coc-settings.json

# tmux配置文件
if [ -e ~/.tmux.conf ]; then
    echo ".tmux.conf already exists. cp .tmux.conf.bak"
    cp ~/.tmux.conf ~/.tmux.conf.bak
echo "ln -s ~/Dot_files/.tmux.conf ~/.tmux.conf"
ln -s ~/Dot_files/.tmux.conf ~/.tmux.conf

# 安装node.js
curl -sL install-node.now.sh/lts | bash

# 安装vim-plug插件管理器
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 安装ag
yum install the_silver_searcher

# 安装fzf
git clone --depth 1 https://github.com/junegunn/fzf/git ~/.fzf
cd ~/.fzf
./install
