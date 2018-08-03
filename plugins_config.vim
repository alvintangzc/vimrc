
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

" Sublime Text's awesome multiple selection feature; fetches https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" highlight yank area; fetch: https://github.com/machakann/vim-highlightedyank
Plug 'machakann/vim-highlightedyank'

" quick menu; fetch: https://github.com/skywind3000/quickmenu.vim
Plug 'skywind3000/quickmenu.vim'

".c .h switch; fetch: https://github.com/vim-scripts/a.vim
Plug 'vim-scripts/a.vim'

" svn git tools; fetch: https://github.com/mhinz/vim-signify
Plug 'mhinz/vim-signify'

" c++ highlight; fetch: https://github.com/octol/vim-cpp-enhanced-highlight
Plug 'octol/vim-cpp-enhanced-highlight'

"replace plugin; fetch: https://github.com/brooth/far.vim
Plug 'brooth/far.vim'

" surroundings; fetch: https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" auto pair; fetch: https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

" gtags; fetch: https://github.com/ludovicchabant/vim-gutentags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" indent line; fetch: https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

" motion move; fetch: https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'

" search increase; fetch: https://github.com/haya14busa/incsearch.vim
Plug 'haya14busa/incsearch.vim'

" first screen; fetch: https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" ycm; fetch: https://github.com/valloric/youcompleteme
Plug 'valloric/youcompleteme'
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
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1


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
" autocmd VimEnter * if argc() == 0  && !exists("s:std_in") | exe 'NERDTree' | wincmd p | endif
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
nnoremap <silent> <F3> :BTags<CR>

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
call g:quickmenu#append('# Common', '')

call g:quickmenu#append('1.1 Yank', 'echo "<ctrl+r>\" -- paste to command"', 'Yank')
call g:quickmenu#append('1.2 EasyAlign', 'echo "vipga=\" -- 按=进行排列"', 'EasyAlign')
call g:quickmenu#append('1.3 Surround', 'echo "cs\"'' -> change \" -> ''"', 'Surround')

" section 2
call g:quickmenu#append('# Misc', '')

call g:quickmenu#append('item 2.1', 'echo "2.1 is selected"', 'select item 2.1')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-cpp-enhanced-highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set completeopt=longest,menu
set completeopt=menu,menuone

"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0

" 开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}

"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'

inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"  "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <M-g> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>ji :YcmCompleter GoToImplementation<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"inoremap <leader><leader> <C-x><C-o>

"tags
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
" find . -type f   | grep -v "middle" | grep -v "cftlib" | grep -v ".svn" > gtags_filelist
" .gutgtags 项目配置文件 加入 -f gtags_filelist 两行
" gtags --incremental /data/alvintang/.cache/tags/data-alvintang-service-cosrv- -f gtags_filelist
"
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

let g:gutentags_define_advanced_commands = 1

" easy motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"incsearch
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"  term
if has('nvim')
  fu! OpenTerminal()
   " open split windows on the topleft
   belowright split
   " resize the height of terminal windows to 30
   resize 10
   :terminal
  endf
else
  fu! OpenTerminal()
   " open split windows on the topleft
   belowright split
   " resize the height of terminal windows to 30
   resize 10
   :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
  endf
endif

nnoremap <F4> :call OpenTerminal()<cr>
