syntax on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set hls
set is
set number
set spell
set wrap
set guioptions-=T
colorscheme wombat256
source $VIMRUNTIME/macros/matchit.vim

if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

set guifont=Liberation\ Mono\ 13
