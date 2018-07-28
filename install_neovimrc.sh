#!/bin/sh
set -e

cd ~/.config

echo 'set runtimepath+=~/.config/vimrc

source ~/.config/vimrc/basic.vim
source ~/.config/vimrc/plugins_config.vim ' > ~/.config/nvim/init.vim

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
