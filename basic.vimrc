" basic .vimrc

set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=usc-bom,utf-8,gbk,gb18030,big5,euc-jp,euc-kr,latin
set fileformats=unix,dos,mac
set ttimeout
set ttimeoutlen=50
set tags=./.tags;,.tags

filetype plugin indent on

set winaltkeys=no
let g:mapleader = ","
let g:maplocalleader = ";"

set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set noerrorbells
set visualbell

set hlsearch
set smartcase
set ignorecase
set incsearch
set regexpengine=1

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set softtabstop=4

set autoread
set confirm
set autochdir

set laststatus=2
set ruler
set showcmd
set cmdheight=1

set wildmenu
set noswapfile
set undolevels=1000
set history=1000
set backspace=indent,eol,start

set ttyfast
set lazyredraw
set updatetime=1000

" SETTINGS
syntax on
set background=dark
"colorscheme desert
colorscheme gruvbox

if has('gui_running')
    set guicursor=a:block-blinkon0
    set guioptions-=g
    set guioptions-=m
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R

    set guioptions-=e

    set t_Co=256

    set guifont=Hack_NF:h10.5
    "set guifont=Menlo:h10.5
    "set guifont=BitstreamVeraSansMono_NF:h10.5
    "set guifont=Roboto_Mono:h10.5
endif

set mouse=a
set mousehide
set selection=exclusive
set selectmode=mouse,key

if has('clipboard')
    if has('unnameplug')
        set clipboard=unamed,unnameplug
    else
        set clipboard=unnamed
    endif
endif

" BUFFER & TABPAGE & WINDOW
set hidden
set tabpagemax=50
set splitright
set splitbelow

set showmatch
set matchtime=3
set cursorline

" FORMAT
set virtualedit=block,onemore
set scrolljump=3
set scrolloff=1

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set display+=lastline

" LINE
set formatoptions+=j
set formatoptions+=m
set formatoptions+=B

set helplang=cn

" SETTINGS
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader><Space> :set hlsearch!<CR>
