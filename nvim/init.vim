if has('win32')
	call plug#begin('~/AppData/Local/nvim/plugged')
endif
if has('unix')
	call plug#begin('~/.config/nvim/plugged')
endif

" Color scheme
Plug 'morhetz/gruvbox'

" Airline
Plug 'vim-airline/vim-airline'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Navigation in-file
Plug 'easymotion/vim-easymotion'

" Fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Nerdtree
"Plug 'preservim/nerdtree'

" Ranger
Plug 'rbgrouleff/bclose.vim'

" Undo tree
Plug 'mbbill/undotree'

" Comment
Plug 'scrooloose/nerdcommenter'

" Multiple cursors
"Plug 'terryma/vim-multiple-cursors'

" Autocomplete
"Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Auto closing brackets
"Plug 'jiangmiao/auto-pairs'

" Allow moving between Vim panes and tmux splits seamlessly
Plug 'christoomey/vim-tmux-navigator'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Rnvimr
Plug 'kevinhwang91/rnvimr'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:let mapleader = ","
:let maplocalleader = ","

" Color scheme
colorscheme gruvbox
set background=dark    " Setting dark mode

" Configure tab settings
set shiftwidth=4
set tabstop=4
set expandtab

set paste

" Relative line number with absolute number of the current line
set number relativenumber

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Undo tree
nnoremap <F5> :UndotreeToggle<CR>

" Maintain undo history between sessions
if has('win32')
    set undodir=~/AppData/Local/nvim/undodir    " Dir to save undo info for Windows
endif
if has('unix')
    set undodir=~/.config/nvim/undodir  " Dir to save undo info for Linux
endif
set undodir=~/.config/nvim/undodir  " Dir to save undo info
set undofile                        " Enable undo
set undolevels=1000                 " How many undos
set undoreload=10000                " Number of lines to save for undo

" Easymotion highlight colors for readability in light themes
hi link EasyMotionTarget Search
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Search
hi link EasyMotionShade Comment

" FZF
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
nnoremap <silent> <leader>r :Rg<cr>
let $FZF_DEFAULT_COMMAND='find .'

"" Multi Cursors
":let g:multi_cursor_use_default_mapping=0
":let g:multi_cursor_start_word_key      = '<C-n>'
":let g:multi_cursor_select_all_word_key = '<A-n>'
":let g:multi_cursor_start_key           = 'g<C-n>'
":let g:multi_cursor_select_all_key      = 'g<A-n>'
":let g:multi_cursor_next_key            = '<C-n>'
":let g:multi_cursor_prev_key            = '<C-p>'
":let g:multi_cursor_skip_key            = '<C-x>'
":let g:multi_cursor_quit_key            = '<Esc>'

" YouCompleteMe
"nnoremap jd :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GoTo<CR>
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_max_num_candidates = 16
let g:ycm_max_num_identifier_candidates = 10
let g:ycm_auto_trigger = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_allow_changing_updatetime = 0
let g:ycm_disable_for_files_larger_than_kb = 1000

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Ranger
noremap <leader>t :RnvimrToggle<CR>

" Vim airline tab
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#tab_nr_type = 1 "tab number
