
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

" indent line; fetch: https://github.com/nathanaelkane/vim-indent-guides
Plug 'nathanaelkane/vim-indent-guides'
" auto pair; fetch: https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'
" indent line; fetch: https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

" motion move; fetch: https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'

" search increase; fetch: https://github.com/haya14busa/incsearch.vim
Plug 'haya14busa/incsearch.vim'

" first screen; fetch: https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" mul mark; fetch: https://github.com/mbriggs/mark.vim
Plug 'mbriggs/mark.vim'

Plug 'vim-scripts/YankRing.vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" assuming your using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
" ncm2 requires nvim-yarp
Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'

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
let g:airline#extensions#tabline#enabled = 0
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
call g:quickmenu#append('# F键功能', '')

call g:quickmenu#append('F4  打开终端', 'echo "show terminal"', 'F4-show-terminal')
call g:quickmenu#append('F8  Tags列表', 'echo "show tags"', 'F8-show-tags')
call g:quickmenu#append('F12 打开帮助', 'echo "show this"', 'F12-show-help')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-cpp-enhanced-highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" easy motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>s <Plug>(easymotion-overwin-f)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

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



nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev
nmap <Leader>mc <Plug>MarkAllClear 
nmap <Leader>mn <Plug>MarkSearchCurrentNext
nmap <Leader>mp <Plug>MarkSearchCurrentPrev
nmap <unique> <silent> <Leader>mk <Plug>MarkSet
vmap <unique> <silent> <Leader>mk <Plug>MarkSet

nnoremap <Leader>//  <Plug>NERDCommenterToggle
vnoremap <Leader>//  <Plug>NERDCommenterToggle

let g:deoplete#enable_at_startup = 1

" 加入这个preview默认在下面展示，也会影响默认的sp
set splitbelow

let g:LanguageClient_serverCommands = {
    \ 'cpp': ['cquery',  '--log-file=~/.cache/log/cq.log',  '--init={"cacheDirectory":"~/.cache/cquery-cache/"}'],
    \ 'c': ['cquery',  '--log-file=~/.cache/log/cq.log',  '--init={"cacheDirectory":"~/.cache/cquery-cache/"}'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c

au TextChangedI * call ncm2#auto_trigger()

inoremap <c-c> <ESC>

inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" tab s-tab for moving in snippet
imap <c-u> <Plug>(ultisnips_expand)
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<Tab>"
let g:UltiSnipsJumpBackwardTrigger	= "<S-Tab>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" indent
let g:indent_guides_enable_on_vim_startup = 1

" mhinz/vim-startify
" gen by http://patorjk.com/software/taag/
let g:startify_lists = [
    \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]

let g:yankring_history_dir = '~/.cache/'


let g:startify_custom_header = [
\'  ██   █       ▄   ▄█    ▄           ▄   ▄█ █▀▄▀█  ',
\'  █ █  █        █  ██     █           █  ██ █ █ █  ',
\'  █▄▄█ █   █     █ ██ ██   █     █     █ ██ █ ▄ █  ',
\'  █  █ ███▄ █    █ ▐█ █ █  █      █    █ ▐█ █   █  ',
\'     █     ▀ █  █   ▐ █  █ █       █  █   ▐    █   ',
\'    █         █▐      █   ██        █▐        ▀    ',
\'   ▀          ▐                     ▐              ',
\ ]

