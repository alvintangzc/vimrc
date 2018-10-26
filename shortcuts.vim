" 跳转定义和原型
nmap <leader>ii [<c-i>
nmap <leader>dd [<c-d>

" 进入xshell复制前
func ShowFormat()
    setlocal paste
    set list
    set nu
endfunc

func DisShowFormat()
    setlocal nopaste
    set nolist
    set nonu
endfunc

nmap <Leader>ss :call ShowFormat()<CR>
nmap <Leader>ds :call DisShowFormat()<CR>

" Fast saving
nmap <leader>fw :w!<cr>

" 映射terminal
tnoremap <Esc> <C-\><C-n>

noremap <C-j> 20j
inoremap <C-j> <ESC>20j

noremap <C-k> 20k
inoremap <C-k> <ESC>20k

if exists('g:gui_oni')
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
endif