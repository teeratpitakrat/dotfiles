set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NERDTree
Plugin 'scrooloose/nerdtree'
" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'
" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" airline status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" easymotion
Plugin 'easymotion/vim-easymotion'
" syntax checking
"Plugin 'scrooloose/syntastic'
" comment
Plugin 'scrooloose/nerdcommenter'
" color
Plugin 'gosukiwi/vim-atom-dark'
" indentation line
Plugin 'Yggdroot/indentLine'
" latex
Plugin 'lervag/vimtex'
" vim tmux navigator
Plugin 'christoomey/vim-tmux-navigator'
" vim-surround
Plugin 'tpope/vim-surround'
" golang
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
:let mapleader = ","
:let maplocalleader = ","
syntax on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set hls " highlight
set is
set number
set spell
set wrap
set guifont=Droid\ Sans\ Mono\ Dotted\ 11
set rnu
colorscheme atom-dark-256
set foldmethod=syntax
set foldnestmax=2

" Remember last position when re-open a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Eliminating delays on ESC in vim and zsh
set timeoutlen=1000 ttimeoutlen=10

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" airline
set laststatus=2
let g:airline_powerline_fonts = 1

" gitgutter
set updatetime=250

" syntax checking
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_continuous = 1
let vimtex_latexmk_background = 1
let vimtex_fold_enabled = 1
let vimtex_fold_manual = 1
