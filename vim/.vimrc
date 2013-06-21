syntax on
set autoindent
filetype plugin indent on
set smartindent
set tabstop=4
set shiftwidth=4
set hls
set is
set number
set spell
set wrap
autocmd InsertEnter,InsertLeave * set cul! " cursorline in Insert mode
" colorscheme wombat
colorscheme wombat256
source $VIMRUNTIME/macros/matchit.vim

" vim-r plugin
set nocompatible
syntax enable
filetype plugin on
filetype indent on
let vimrplugin_screenplugin = 0

" latex suite
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
