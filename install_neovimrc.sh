#!/bin/sh
set -e

mkdir -p ~/.config/nvim
cd ~/.config

if [ -f " ~/.config/nvim/init.vim" ];then
    cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak
fi

#    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'set runtimepath+=~/.config/vimrc

let g:python_host_prog = "/usr/bin/python"
let g:python3_host_prog = "/usr/local/bin/python3"

source ~/.config/vimrc/basic.vim
source ~/.config/vimrc/plugins_config.vim
source ~/.config/vimrc/shortcuts.vim ' > ~/.config/nvim/init.vim


echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
