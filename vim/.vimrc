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
Plugin 'morhetz/gruvbox'
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
" ranger
Plugin 'francoiscabrol/ranger.vim'
Plugin 'rbgrouleff/bclose.vim'
" undo
Plugin 'sjl/gundo.vim'
" vimdiff char
Plugin 'rickhowe/diffchar.vim'

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
set foldmethod=syntax
set foldnestmax=2
set conceallevel=0
let g:indentLine_setConceal = 0
set paste

" Remember last position when re-open a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Eliminating delays on ESC in vim and zsh
set timeoutlen=1000 ttimeoutlen=10

" color
set background=dark
let g:gruvbox_italic = 0
let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_light = "hard"
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox

" easymotion highlight colors for readability in light themes
hi link EasyMotionTarget Search
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Search
hi link EasyMotionShade Comment

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_mruf_max=500
let g:ctrlp_clear_cache_on_exit=0

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
let g:tex_conceal = ""
let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_latexmk_continuous = 1
let vimtex_latexmk_background = 1
let vimtex_fold_enabled = 1
let vimtex_fold_manual = 1

" ranger
let g:ranger_map_keys = 0
map <leader>f :RangerNewTab<CR>

" gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
let g:gundo_help = 0
let g:gundo_return_on_revert = 0
