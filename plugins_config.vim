
""""""""""""""""""""""""""""""
" => vim-plug
""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" color scheme; fetch https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

" status/tabline fetch: https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" fzf  https://github.com/junegunn/fzf.vim
" first install the_silver_searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" NERDTree; fetches https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" YankStack; fetches https://github.com/maxbrunsfeld/vim-yankstack
Plug 'maxbrunsfeld/vim-yankstack'

" Sublime Text's awesome multiple selection feature<Paste>; fetches https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" highlight yank area; fetch: https://github.com/machakann/vim-highlightedyank
Plug 'machakann/vim-highlightedyank'

" quick menu; fetch: https://github.com/skywind3000/quickmenu.vim
Plug 'skywind3000/quickmenu.vim'


" tags ; fetch: https://github.com/ludovicchabant/vim-gutentags<Paste>
"               https://github.com/skywind3000/gutentags_plus
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

".c .h switch; fetch: https://github.com/vim-scripts/a.vim
Plug 'vim-scripts/a.vim'

" svn git tools; fetch: https://github.com/mhinz/vim-signify
Plug 'mhinz/vim-signify'
" surroundings; fetch: https://github.com/tpope/vim-surround
" Plug 'tpope/vim-surround'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""
" => morhetz/gruvbox
""""""""""""""""""""""""""""""
colorscheme gruvbox
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 14

""""""""""""""""""""""""""""""
" => vim-airline
""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
" let g:airline#extensions#tabline#formatter = 'unique_tail'


""""""""""""""""""""""""""""""
" => vim-easy-align
""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
" autocmd vimenter * NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0  && !exists("s:std_in") | exe 'NERDTree' | wincmd p | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos   = "right"
let NERDTreeShowHidden = 0
let NERDTreeIgnore     = ['\.pyc$', '\.o', '__pycache__']
let g:NERDTreeWinSize  = 30
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

""""""""""""""""""""""""""""""
" => fzf
""""""""""""""""""""""""""""""
let g:fzf_layout = { 'down': '~30%' }
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fh :History<CR>

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <silent> <Leader>ag :Ag<CR>

""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>pp <Plug>yankstack_substitute_newer_paste


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-d>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<A-d>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-s-p>'
let g:multi_cursor_skip_key            = '<C-k>'
let g:multi_cursor_quit_key            = '<Esc>'

" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "LH"

" clear all the items
call g:quickmenu#reset()

" bind to F12
noremap <silent><F12> :call quickmenu#toggle(0)<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => quick menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" section 1, text starting with "#" represents a section (see the screen capture below)
call g:quickmenu#append('# Develop', '')

call g:quickmenu#append('item 1.1', 'echo "1.1 is selected"', 'select item 1.1')
call g:quickmenu#append('item 1.2', 'echo "1.2 is selected"', 'select item 1.2')
call g:quickmenu#append('item 1.3', 'echo "1.3 is selected"', 'select item 1.3')

" section 2
call g:quickmenu#append('# Misc', '')

call g:quickmenu#append('item 2.1', 'echo "2.1 is selected"', 'select item 2.1')
call g:quickmenu#append('item 2.2', 'echo "2.2 is selected"', 'select item 2.2')
call g:quickmenu#append('item 2.3', 'echo "2.3 is selected"', 'select item 2.3')
call g:quickmenu#append('item 2.4', 'echo "2.4 is selected"', 'select item 2.4')



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-gutentags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"GTAGSLABEL 告诉 gtags 默认 C/C++/Java 等六种原生支持的代码直接使用 gtags 本地分析器，而其他语言使用 pygments 模块
let $GTAGSLABEL = 'native-pygments'
"环境变量必须设置，否则会找不到 native-pygments 和 language map 的定义， Windows 下面在 gtags/share/gtags/gtags.conf，Linux 下要到 /usr/local/share/gtags 里找
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

set cscopetag
set cscopeprg=’gtags-cscope’

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = ['gtags_cscope']

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

let g:gutentags_define_advanced_commands = 1

