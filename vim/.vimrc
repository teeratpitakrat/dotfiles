syntax on
set autoindent
filetype plugin indent on
set smartindent
set tabstop=4
set showtabline=2
set shiftwidth=4
set hls
set is
set number
set nospell
set wrap
autocmd InsertEnter,InsertLeave * set cul! " cursorline in Insert mode
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

" Mode Indication -Prominent!
function! InsertStatuslineColor(mode)
	if a:mode == 'i'
		hi statusline guibg=red
		set cursorcolumn
	elseif a:mode == 'r'
		hi statusline guibg=blue
	else
		hi statusline guibg= magenta
	endif
endfunction

function! InsertLeaveActions()
	hi statusline guibg=green
	set nocursorcolumn
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertLeaveActions()

" to handle exiting insert mode via a control-C
inoremap <c-c> <c-o>:call InsertLeaveActions()<cr><c-c>

" default the statusline to green when entering Vim
hi statusline guibg=green

" have a permanent statusline to color
set laststatus=2
