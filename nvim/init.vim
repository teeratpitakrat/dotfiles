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
Plug 'preservim/nerdtree'

" Undo tree
Plug 'mbbill/undotree'

" Comment
Plug 'scrooloose/nerdcommenter'

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
