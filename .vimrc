" ~/.vim/.vimrc
"
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=usc-bom,utf-8,gbk,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=unix,dos,mac
set ttimeout
set ttimeoutlen=50
set tags=./.tags;,.tags
set path+=.
set path +=C:/Progra~2/Microsoft\\\ Visual\\\ Studio/2019/Community/VC/Tools/MSVC/14.29.30037/ATLMFC/include
set path +=C:/Progra~2/Microsoft\\\ Visual\\\ Studio/2019/Community/VC/Tools/MSVC/14.29.30037/include
set path +=C:/Progra~2/Windows\\\ Kits/10/include/10.0.19041.0/ucrt
set path +=C:/Progra~2/Windows\\\ Kits/10/include/10.0.19041.0/shared
set path +=C:/Progra~2/Windows\\\ Kits/10/include/10.0.19041.0/um
set path +=C:/Progra~2/Windows\\\ Kits/10/include/10.0.19041.0/winrt
set path +=C:/Progra~2/Windows\\\ Kits/10/include/10.0.19041.0/cppwinrt

filetype plugin indent on

set winaltkeys=no
let g:mapleader = ","
let g:maplocalleader = ";"

"let g:python3_host_prog = 'D:\gpc\software\run\apps\dev\python\3.9.5\python.exe'
set pyxversion=3

let g:bundle_groups  = ['basic', 'general', 'programming', 'git', 'airline', 'leaderf']
let g:bundle_groups += ['vista', 'polyglot', 'dogo', 'test', 'coc', 'ale', 'ultisnips']
"let g:bundle_groups += ['vista', 'polyglot', 'dogo', 'test', 'ultisnips']
let g:bundle_groups += ['vimcdoc', 'translate', 'ultisnips', 'vista', 'tags', 'cpp', 'gas']
let g:bundle_groups += ['crefvim', 'echodoc', 'nerdtree']
let g:bundle_groups += ['markdown-preview', 'hdl', 'go']

if !exists('g:bundle_groups')
    let g:bundle_groups = []
    "let g:bundle_groups  = ['basic', 'general', 'programming', 'git', 'airline', 'leaderf']
    "let g:bundle_groups += ['vista', 'polyglot', 'dogo', 'test', 'coc', 'ale', 'ultisnips']
    "let g:bundle_groups += ['vimcdoc', 'translate', 'ale', 'coc', 'ultisnips', 'vista', 'tags', 'cpp', 'gas']
endif

" PLUGIN
call plug#begin('~/.vim/plugged')

Plug 'chrisbra/vim-diff-enhanced'
Plug 'tpope/vim-eunuch'

if index(g:bundle_groups, 'basic') >= 0
    Plug 'flazz/vim-colorschemes'
    Plug 'srcery-colors/srcery-vim'
    "Plug 'altercation/vim-colors-solarized'
    "Plug 'tomasr/molokai'
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
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

    " SESSION
    Plug 'thaerkh/vim-workspace'

    Plug 't9md/vim-choosewin'

    " VIM SCRIPT DEBUG
    Plug 'tweekmonster/exception.vim'

    " TMUX
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'wellle/tmux-complete.vim'

    " VIM-CHOOSEWIN
    nmap <M-e> <Plug>(choosewin)

    " NUMBERS
    nnoremap <Leader>n :NumbersToggle<CR>
    nnoremap <Leader>nr :NumbersOnOff<CR>

    " INDENTLINE
    let g:indentLine_char = '┊'

    " EXCEPTION.VIM
    command! WTF call exception#trace()

    " TMUX-NAVIGATOR
    let g:tmux_navigator_save_on_switch = 1

endif

" GENERAL
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

    Plug 'editorconfig/editorconfig-vim'
    Plug 'markonm/traces.vim'

    " EDITORCONFIG-VIM
    "let g:EditorConfig_exec_path = 'C:\ProgramData\scoop\shims\editorconfig.exe'

    " PANGU
    autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()
endif

" PROGRAMMING
if index(g:bundle_groups, 'programming') >= 0
    Plug 'asins/vim-dict'
    Plug 'preservim/nerdcommenter'
    Plug 'sbdchd/neoformat'

    " ASYNC
    Plug 'skywind3000/asyncrun.vim'
    Plug 'mh21/errormarker.vim'
    Plug 'pedsm/sprint'

    " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
    Plug 'skywind3000/vim-preview'
    " SYNTAX
    Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

    " DEBUG
    Plug 'puremourning/vimspector'

    " ERRORMARKER
    let errormarker_disablemappings = 1

    " VIMSPECTOR
    "let g:vimspector_enable_mappings = 'HUMAN'
endif

" COC
if index(g:bundle_groups, 'coc') >= 0
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" ALE - LANGUAGE SERVER CLIENT
if index(g:bundle_groups, 'ale') >= 0
    Plug 'dense-analysis/ale'

    " 设定延迟和提示信息
    let g:ale_completion_delay = 500
    let g:ale_echo_delay = 20
    let g:ale_lint_delay = 500
    let g:ale_echo_msg_format = '[%linter%] %code: %%s'

    " 设定检测的时机：normal 模式文字改变，或者离开 insert模式
    " 禁用默认 INSERT 模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_insert_leave = 1

    " 在 linux/mac 下降低语法检查程序的进程优先级（不要卡到前台进程）
    if has('win32') == 0 && has('win64') == 0 && has('win32unix') == 0
        let g:ale_command_wrapper = 'nice -n5'
    endif

    " 允许 airline 集成
    let g:airline#extensions#ale#enabled = 1

    " 编辑不同文件类型需要的语法检查器
    let g:ale_linters = {
                \ 'c': ['gcc', 'cppcheck'],
                \ 'cpp': ['gcc', 'cppcheck'],
                \ }

    let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
    let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
    let g:ale_c_cppcheck_options = ''
    let g:ale_cpp_cppcheck_options = ''

    " 如果没有 gcc 只有 clang 时（FreeBSD）
    if executable('gcc') == 0 && executable('clang')
        let g:ale_linters.c += ['clang']
        let g:ale_linters.cpp += ['clang']
    endif
endif

" EHCODOC
if index(g:bundle_groups, 'echodoc') >= 0
	Plug 'Shougo/echodoc.vim'
	set noshowmode
	let g:echodoc#enable_at_startup = 1
endif

" ULTISNIPS
if index(g:bundle_groups, 'ultisnips') >= 0
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
endif

" DEOPLETE
if index(g:bundle_groups, 'deoplete') >= 0
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    let g:deoplete#enable_at_startup = 1
endif

" CPP
if index(g:bundle_groups, 'cpp') >= 0
    Plug 'vim-scripts/a.vim'
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
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
    let g:airline#extensions#branch#enabled = 0
    let g:airline#extensions#syntastic#enabled = 0
    let g:airline#extensions#fugitiveline#enabled = 0
    let g:airline#extensions#csv#enabled = 0
    let g:airline#extensions#vimagit#enabled = 0
endif

" LEADERF
if index(g:bundle_groups, 'leaderf') >= 0
    " 如果 vim 支持 python 则启用  Leaderf
    if has('python') || has('python3')
        Plug 'Yggdroot/LeaderF', { 'do' : 'LeaderfInstallCException' }

        " CTRL+p 打开文件模糊匹配
        let g:Lf_ShortcutF = '<c-p>'

        " ALT+n 打开 buffer 模糊匹配
        let g:Lf_ShortcutB = '<m-n>'

        " CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
        noremap <c-n> :LeaderfMru<cr>

        " ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
        noremap <m-p> :LeaderfFunction!<cr>

        " ALT+SHIFT+p 打开 tag 列表，i 进入模糊匹配，ESC退出
        noremap <m-P> :LeaderfBufTag!<cr>

        " ALT+n 打开 buffer 列表进行模糊匹配
        noremap <m-n> :LeaderfBuffer<cr>

        " ALT+m 全局 tags 模糊匹配
        noremap <m-m> :LeaderfTag<cr>

        " 最大历史文件保存 2048 个
        let g:Lf_MruMaxFiles = 2048

        " ui 定制
        let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

        " 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
        let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git', '.gitignore', 'Makefile', 'README.md']
        let g:Lf_WorkingDirectoryMode = 'Ac'
        let g:Lf_WindowHeight = 0.30
        let g:Lf_CacheDirectory = expand('~/.vim/cache')

        " 显示绝对路径
        let g:Lf_ShowRelativePath = 0

        " 隐藏帮助
        let g:Lf_HideHelp = 1

        " 模糊匹配忽略扩展名
        let g:Lf_WildIgnore = {
                    \ 'dir': ['.svn','.git','.hg'],
                    \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
                    \ }

        " MRU 文件忽略扩展名
        let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
        let g:Lf_StlColorscheme = 'powerline'

        " 禁用 function/buftag 的预览功能，可以手动用 p 预览
        let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

        " 使用 ESC 键可以直接退出 leaderf 的 normal 模式
        let g:Lf_NormalMap = {
                \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
                \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
                \ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
                \ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
                \ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
                \ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
                \ }

    else
        " 不支持 python ，使用 CtrlP 代替
        Plug 'ctrlpvim/ctrlp.vim'

        " 显示函数列表的扩展插件
        Plug 'tacahiroy/ctrlp-funky'

        " 忽略默认键位
        let g:ctrlp_map = ''

        " 模糊匹配忽略
        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/]\.(git|hg|svn)$',
          \ 'file': '\v\.(exe|so|dll|mp3|wav|sdf|suo|mht)$',
          \ 'link': 'some_bad_symbolic_links',
          \ }

        " 项目标志
        let g:ctrlp_root_markers = ['.project', '.root', '.svn', '.git']
        let g:ctrlp_working_path = 0

        " CTRL+p 打开文件模糊匹配
        noremap <c-p> :CtrlP<cr>

        " CTRL+n 打开最近访问过的文件的匹配
        noremap <c-n> :CtrlPMRUFiles<cr>

        " ALT+p 显示当前文件的函数列表
        noremap <m-p> :CtrlPFunky<cr>

        " ALT+n 匹配 buffer
        noremap <m-n> :CtrlPBuffer<cr>
    endif
endif

" VIMCDOC
if index(g:bundle_groups, 'vimcdoc') >= 0
    Plug 'asins/vimcdoc'
endif

" VISTA
if index(g:bundle_groups, 'vista') >= 0
    Plug 'liuchengxu/vista.vim'

    nnoremap <F2> :Vista!!<CR>
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

" POLYGLOT
if index(g:bundle_groups, 'polyglot') >= 0
    Plug 'sheerun/vim-polyglot'
endif

" DOGO
if index(g:bundle_groups, 'doge') >= 0
    Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
endif

" TEST
if index(g:bundle_groups, 'test') >= 0
    Plug 'vim-test/vim-test'
endif

" MARKDOWN
if index(g:bundle_groups, 'markdown') >= 0
    " MARKDOWN
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
endif

" MARKDOWN PREVIEW
if index(g:bundle_groups, 'markdown-preview') >= 0
    " PREVIEW
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

    nmap <C-s> <Plug>MarkdownPreview
    nmap <M-s> <Plug>MarkdownPreviewStop
    nmap <C-m> <Plug>MarkdownPreviewToggle
endif

" WRITING
if index(g:bundle_groups, 'wiki') >= 0
    Plug 'vimwiki/vimwiki'
endif

" TRANSLATE
if index(g:bundle_groups, 'translate') >= 0
    Plug 'voldikss/vim-translator'

    "let g:translator_proxy_url = 'socks5://127.0.0.1:1081'
    " Echo translation in the cmdline
    nmap <silent> <Leader>tt <Plug>Translate
    vmap <silent> <Leader>tt <Plug>TranslateV
    " Display translation in a window
    nmap <silent> <Leader>tw <Plug>TranslateW
    vmap <silent> <Leader>tw <Plug>TranslateWV
    " Replace the text with translation
    nmap <silent> <Leader>tr <Plug>TranslateR
    vmap <silent> <Leader>tr <Plug>TranslateRV
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

" VIM_GAS
if index(g:bundle_groups, 'gas') >= 0
    Plug 'shirk/vim-gas'
endif

" CREFVIM
if index(g:bundle_groups, 'crefvim') >= 0
    Plug 'vim-scripts/CRefVim'
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

if index(g:bundle_groups, 'programming') >= 0
    "----------------------------------------------------------------------
    " 编译运行 C/C++ 项目
    " 详细见：http://www.skywind.me/blog/archives/2084
    "----------------------------------------------------------------------

    " 自动打开 quickfix window ，高度为 6
    let g:asyncrun_open = 6

    " 任务结束时候响铃提醒
    let g:asyncrun_bell = 1

    " 设置 F10 打开/关闭 Quickfix 窗口
    nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

    " F9 编译 C/C++ 文件
    nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

    " F5 运行文件
    nnoremap <silent> <F5> :call ExecuteFile()<cr>

    " F7 编译项目
    nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>

    " F8 运行项目
    nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>

    " F6 测试项目
    nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>

    " 更新 cmake
    nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>

    " Windows 下支持直接打开新 cmd 窗口运行
    if has('win32') || has('win64')
        nnoremap <silent> <F8> :AsyncRun -cwd=<root> -mode=4 make run <cr>
    endif
endif

if index(g:bundle_groups, 'go') >= 0
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
endif
"----------------------------------------------------------------------
" F5 运行当前文件：根据文件类型判断方法，并且输出到 quickfix 窗口
"----------------------------------------------------------------------
function! ExecuteFile()
    let cmd = ''
    if index(['c', 'cpp', 'rs', 'go'], &ft) >= 0
        " native 语言，把当前文件名去掉扩展名后作为可执行运行
        " 写全路径名是因为后面 -cwd=? 会改变运行时的当前路径，所以写全路径
        " 加双引号是为了避免路径中包含空格
        let cmd = '"$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
    elseif &ft == 'python'
        let $PYTHONUNBUFFERED=1 " 关闭 python 缓存，实时看到输出
        let cmd = 'python "$(VIM_FILEPATH)"'
    elseif &ft == 'javascript'
        let cmd = 'node "$(VIM_FILEPATH)"'
    elseif &ft == 'perl'
        let cmd = 'perl "$(VIM_FILEPATH)"'
    elseif &ft == 'ruby'
        let cmd = 'ruby "$(VIM_FILEPATH)"'
    elseif &ft == 'php'
        let cmd = 'php "$(VIM_FILEPATH)"'
    elseif &ft == 'lua'
        let cmd = 'lua "$(VIM_FILEPATH)"'
    elseif &ft == 'zsh'
        let cmd = 'zsh "$(VIM_FILEPATH)"'
    elseif &ft == 'ps1'
        let cmd = 'powershell -file "$(VIM_FILEPATH)"'
    elseif &ft == 'vbs'
        let cmd = 'cscript -nologo "$(VIM_FILEPATH)"'
    elseif &ft == 'sh'
        let cmd = 'bash "$(VIM_FILEPATH)"'
    else
        return
    endif
    " Windows 下打开新的窗口 (-mode=4) 运行程序，其他系统在 quickfix 运行
    " -raw: 输出内容直接显示到 quickfix window 不匹配 errorformat
    " -save=2: 保存所有改动过的文件
    " -cwd=$(VIM_FILEDIR): 运行初始化目录为文件所在目录
    if has('win32') || has('win64')
        exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=4 '. cmd
    else
        exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=0 '. cmd
    endif
endfunc

" vim-hdl
if index(g:bundle_groups, 'hdl') >= 0
    Plug 'suoto/vim-hdl'
endif

call plug#end()

"syntax on
"set background=dark

set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set noerrorbells
set visualbell

"set hlsearch
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
colorscheme gruvbox
"colorscheme desert
"colorscheme srcery

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

    "set guifont=Hack:h10.5
    set guifont=Hack_NF:h10.5
endif

set mouse=a
set mousehide
set selection=exclusive
set selectmode=mouse,key

if has('clipboard')
    if has('unnamedplug')
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

map <silent> <unique> <Leader><Leader>cc <Plug>CRV_CRefVimInvoke

