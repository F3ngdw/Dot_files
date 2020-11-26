#!/bin/bash

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
fi
echo "cp ./init.vim ~/.config/nvim/init.vim ..."
cp ./init.vim ~/.config/nvim/init.vim

echo "cp ./coc-settings.json ~/.config/nvim/coc-settings.json"
cp ./coc-settings.json ~/.config/nvim/coc-settings.json

# tmux配置文件
if [ -e ~/.tmux.conf ]; then
    echo ".tmux.conf already exists. cp .tmux.conf.bak"
    cp ~/.tmux.conf ~/.tmux.conf.bak
fi
echo "cp ./.tmux.conf ~/.tmux.conf"
cp ./.tmux.conf ~/.tmux.conf

# 安装node.js
curl -sL install-node.now.sh/lts | bash

# 安装vim-plug插件管理器
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 安装ag
yum install -y the_silver_searcher

# 安装fzf
git clone --depth 1 https://github.com/junegunn/fzf/git ~/.fzf
cd ~/.fzf
./install
