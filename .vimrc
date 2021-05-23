" ~/.vimrc

set nocompatible
set encoding=utf-8
set fileencodings=usc-bom,utf-8,gbk,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=unix,dos,mac
let g:mapleader = ","
set ttimeout
set ttimeoutlen=50
set winaltkeys=no

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
"Plug 'altercation/vim-colors-solarized'
Plug 'mhinz/vim-startify'

Plug 'psliwka/vim-smoothie'

Plug 'kshenoy/vim-signature'
Plug 'myusuf3/numbers.vim'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'Konfekt/FastFold'

Plug 'unblevable/quick-scope'
Plug 'itchyny/vim-cursorword'

Plug 'farmergreg/vim-lastplace'
Plug 'thaerkh/vim-workspace'

Plug 't9md/vim-choosewin'

Plug 'christoomey/vim-tmux-navigator'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" VIM-CHOOSEWIN
nmap - <Plug>(choosewin)

" NUMBERS
nnoremap <Leader>n :NumbersToggle<CR>
nnoremap <Leader>nr :NumbersOnOff<CR>

" EXCEPTION.VIM
command! WTF call exception#trace()

" TMUX-NAVIGATOR
let g:tmux_navigator_save_on_switch = 1

call plug#end()

syntax on
set background=dark
"colorscheme desert

set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set matchtime=3
set noerrorbells
set visualbell
set nospell

" SEARCH
set hlsearch
set smartcase
set ignorecase
set incsearch

" INDENT
set autoindent
set cindent
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

" METADATA
set confirm
set autoread

set autochdir
set autowriteall

set ruler
set laststatus=2
set showcmd

set undolevels=1000
set backspace=indent,eol,start

set ttyfast
set lazyredraw

syntax enable
set background=dark
colorscheme gruvbox

nnoremap <Leader>sv :source $MYVIMRC<CR>

