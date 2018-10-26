" ��ת�����ԭ��
nmap <leader>ii [<c-i>
nmap <leader>dd [<c-d>

" ����xshell����ǰ
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

" ӳ��terminal
tnoremap <Esc> <C-\><C-n>

noremap <C-j> 20j
inoremap <C-j> <ESC>20j

noremap <C-k> 20k
inoremap <C-k> <ESC>20k

if exists('g:gui_oni')
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
endif