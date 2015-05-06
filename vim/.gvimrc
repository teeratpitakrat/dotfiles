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
set guioptions-=T " remove toolbar
set guifont=Droid\ Sans\ Mono\ Dotted\ 11
colorscheme wombat
source $VIMRUNTIME/macros/matchit.vim

if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

