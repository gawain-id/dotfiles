""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" new.c.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" load once
"if get(s:, 'loaded', 0) != 0
"  finish
"else
"  let s:loaded = 1
"endif

""" init

""" Platform
silent function! OSX()
  return has('macunix')
endfunction

silent function! LINUX()
  return has('unix') && !has('macunix') !has('win32unix')
endfunction

silent function WINDOWS()
  return (has('win32') || has('win64'))
endfunction

if WINDOWS()
  set rtp=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" install
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let data_dir = has('nvim') ? stdpath('data') . '/site' : expand('~/.vim')
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs' .
    \ ' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" bundles
let g:bundle_groups  = ['basic', 'general', 'programming', 'git', 'airline', 'leaderf']
"let g:bundle_groups += ['vista', 'coc', 'ale', 'ultisnips', 'tags', 'nerdtree', 'cpp']
let g:bundle_groups += ['vista', 'coc', 'ale', 'tags', 'nerdtree', 'cpp']
let g:bundle_groups += ['vimcdoc', 'vim']

" begin
call plug#begin(data_dir.'/plugged')

""""""""""""""""""""""""""""""""""""""""
" plugin list
""""""""""""""""""""""""""""""""""""""""
""" default
"Plug 'tpope/vim-sensible'

""" Basic
"if index(g:bundle_groups, 'basic') >= 0
  Plug 'morhetz/gruvbox'
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

  Plug 't9md/vim-choosewin'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'


  " INDENTLINE
  let g:indentLine_char = '┊'

  " TMUX-NAVIGATOR
  let g:tmux_navigator_save_on_switch = 1

"endif

""" General
if index(g:bundle_groups, 'general') >= 0
    Plug 'easymotion/vim-easymotion'
    Plug 'jiangmiao/auto-pairs'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'terryma/vim-expand-region'
    Plug 'tpope/vim-unimpaired'

    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'wellle/visual-split.vim'

    Plug 'mbbill/undotree'
    Plug 'haya14busa/incsearch.vim'
    Plug 'hotoo/pangu.vim'
endif

" PROGRAMMING
if index(g:bundle_groups, 'programming') >= 0
    Plug 'asins/vim-dict'
    Plug 'preservim/nerdcommenter'
    Plug 'sbdchd/neoformat'

    " ASYNC
    Plug 'skywind3000/asyncrun.vim'
    "Plug 'mh21/errormarker.vim'
    Plug 'pedsm/sprint'

    " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
    Plug 'skywind3000/vim-preview'
    " SYNTAX
    Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

endif

""" COC
if index(g:bundle_groups, 'coc') >= 0
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

""" ALE

" ULTISNIPS
if index(g:bundle_groups, 'ultisnips') >= 0
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
endif

" CPP
if index(g:bundle_groups, 'cpp') >= 0
    Plug 'vim-scripts/a.vim'

    "Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

    Plug 'bfrg/vim-cpp-modern'
    "Plug 'skywind3000/vim-cppman'
endif

" AIRLINE - 状态栏渲染
if index(g:bundle_groups, 'airline') >= 0
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_powerline_fonts = 0
    let g:airline_exclude_preview = 1
    let g:airline_section_b = '%n'
    let g:airline_theme='deus'
    let g:airline_extensions = ['tabline', 'coc']
endif

" LeaderF
if index(g:bundle_groups, 'leaderf') >= 0
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
endif

" VISTA
if index(g:bundle_groups, 'vista') >= 0
    Plug 'liuchengxu/vista.vim'

    nnoremap <F2> :Vista!!<CR>
endif

" VIMDOC
if index(g:bundle_groups, 'vimcdoc') >= 0
    Plug 'yianwillis/vimcdoc'
endif

" TAGS
if index(g:bundle_groups, 'tags') >= 0
    " 提供 ctags/gtags 后台数据库自动更新功能
    Plug 'ludovicchabant/vim-gutentags'

    " 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
    " 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
    Plug 'skywind3000/gutentags_plus'

    " 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
    let g:gutentags_project_root = ['.root', '.project']
    let g:gutentags_ctags_tagfile = '.tags'

    " 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
    let g:gutentags_cache_dir = expand('~/.cache/tags')

    " 默认禁用自动生成
    let g:gutentags_modules = []

    " 如果有 ctags 可执行就允许动态生成 ctags 文件
    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif

    " 如果有 gtags 可执行就允许动态生成 gtags 数据库
    if executable('gtags') && executable('gtags-cscope')
        let g:gutentags_modules += ['gtags_cscope']
    endif

    " 设置 ctags 的参数
    let g:gutentags_ctags_extra_args = []
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " 使用 universal-ctags 的话需要下面这行，请反注释
    "let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

    " 禁止 gutentags 自动链接 gtags 数据库
    let g:gutentags_auto_add_gtags_cscope = 1
endif

" GIT
if index(g:bundle_groups, 'git') >= 0
    "GIT
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
    " HUB
    Plug 'tpope/vim-rhubarb'

    " GIT MARK
    "Plug 'vim-scripts/ConflictMotions'

    " GIST
    Plug 'mattn/webapi-vim'
    Plug 'mattn/vim-gist'
endif

" NERDTREE
if index(g:bundle_groups, 'nerdtree') >= 0
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    let g:NERDTreeWinSIze = 32
    let g:NERDTreeWinPos = "left"
    let g:NERDTreeShowHidden = 1

    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeDirArrows = 1
    let g:NERDTreeHijackNetrw = 0

    noremap <space>nn :NERDTree<cr>
    noremap <space>no :NERDTreeFocus<cr>
    noremap <space>nm :NERDTreeMirror<cr>
    noremap <space>nt :NERDTreeToggle<cr>

    noremap <F3> :NERDTreeToggle<cr>
endif

" NASM
if index(g:bundle_groups, 'nasm') >= 0
    let g:asmsyntax = "nasm"
endif

""""""""""""""""""""""""""""""""""""""""
" end
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !WINDOWS()
  set shell=/bin/sh
endif

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

    set guifont=Hack:h10.5
    "set guifont=Menlo:h10.5
    "set guifont=BitstreamVeraSansMono_NF:h10.5
    "set guifont=DejaVu_Sans_Mono:h10.5

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

set langmenu=en_US.UTF-8
set helplang=cn

