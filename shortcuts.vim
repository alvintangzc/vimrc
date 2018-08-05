" Shortcuts for nvim
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" 跳转定义和原型
nmap <leader>ii [<c-i>
nmap <leader>dd [<c-d>

" 进入xshell复制前
func ShowFormat()
    set list
    set nu
endfunc

func DisShowFormat()
    set nolist
    set nonu
endfunc

nmap <Leader>ss :call ShowFormat()<CR>
nmap <Leader>nn :call DisShowFormat()<CR>

" 映射terminal
tnoremap <Esc> <C-\><C-n>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
