mkdir ..\nvim

echo set runtimepath+=~/AppData/Local/nvim/vimrc > ..\nvim\init.vim

echo let g:python_host_prog = "C:/Python27/python.exe"  >> ..\nvim\init.vim
echo let g:python3_host_prog = "C:/Users/alvintang/AppData/Local/Programs/Python/Python37-32/python.exe"  >> ..\nvim\init.vim

echo source ~/AppData/Local/vimrc/basic.vim  >> ..\nvim\init.vim
echo source ~/AppData/Local/vimrc/plugins_config.vim >> ..\nvim\init.vim
echo source ~/AppData/Local/vimrc/shortcuts.vim >> ..\nvim\init.vim


echo Installed the Ultimate Vim configuration successfully! Enjoy :-)
