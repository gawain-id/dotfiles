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
let g:bundle_groups += ['vista', 'coc', 'ale', 'nerdtree', 'cpp']
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
    " https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

    " May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
    " utf-8 byte sequence
    set encoding=utf-8
    " Some servers have issues with backup files, see #649
    set nobackup
    set nowritebackup

    " Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
    " delays and poor user experience
    set updatetime=300

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
    nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
    nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation
    nmap <silent><nowait> gd <Plug>(coc-definition)
    nmap <silent><nowait> gy <Plug>(coc-type-definition)
    nmap <silent><nowait> gi <Plug>(coc-implementation)
    nmap <silent><nowait> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call ShowDocumentation()<CR>

    function! ShowDocumentation()
      if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
      else
        call feedkeys('K', 'in')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s)
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    augroup end

    " Applying code actions to the selected code block
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying code actions at the cursor position
    nmap <leader>ac  <Plug>(coc-codeaction-cursor)
    " Remap keys for apply code actions affect whole buffer
    nmap <leader>as  <Plug>(coc-codeaction-source)
    " Apply the most preferred quickfix action to fix diagnostic on the current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Remap keys for applying refactor code actions
    nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
    xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
    nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

    " Run the Code Lens action on the current line
    nmap <leader>cl  <Plug>(coc-codelens-action)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Remap <C-f> and <C-b> to scroll float windows/popups
    if has('nvim-0.4.0') || has('patch-8.2.0750')
      nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Use CTRL-S for selections ranges
    " Requires 'textDocument/selectionRange' support of language server
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer
    command! -nargs=0 Format :call CocActionAsync('format')

    " Add `:Fold` command to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
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

