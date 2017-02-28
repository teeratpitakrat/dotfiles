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
Plugin 'flazz/vim-colorschemes'
" indentation line
Plugin 'Yggdroot/indentLine'
" vim tmux navigator
Plugin 'christoomey/vim-tmux-navigator'

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
colorscheme wombat

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" ctrlp
let g:ctrlp_map = '<c-p>'
"let g:ctrlp_show_hidden = 1

" airline
set laststatus=2

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
