""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" WEN VIMRC CONFIG
"
" @file: ~/.vimrc
" @author: gawain.id@outlook.com
" @last: 20200807 1:07
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" FUNCTIONS {
    silent function! IS_OSX()                               " Check is MacOS
        return has('macunix')
    endfunction

    silent function! IS_LINUX()                             " Check is Linux
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction

    silent function! IS_WINDOWS()                           " Check is Windows
        return (has('win32') || has('win64'))
    endfunction
" }

" GENERAL OPTIONS {
    set nocompatible                                        " Disable compatible with VI.
    set shortmess+=fiIlmnrxoOtT                             " Show prompts caused by file messages.
    set viewoptions=folds,options,cursor,unix,slash         " Saving and restoring something.

    " ENCODE
    set encoding=utf-8                                      " Use and encoding that supports Unicode.
    set termencoding=utf-8                                  " Terminal encoding.
    set fileencodings=ucs-bom,utf-8,chinese,gbk,\
                        \gb2312,gb18030,big5,\
                        \euc-jp,euc-kr,latin1
                                                            " Detect file encoding in order.
" }

" GUI OPTIONS {
    if IS_WINDOWS()
        set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        set fileformat=dos
    else
        set fileformat=unix                                 " File format.
        set shell=/bin/sh                                   " The shell used to execute commands.
    endif

    " FONT
    if has('gui_running')
        set guicursor=a:block-blinkon0                      " Disable blinking cursor.
        set guioptions-=l                                   " Disable Left-hand scroll bar.
        set guioptions-=L                                   " Disable Left-hand scroll bar is present when there is a vertically split window.
        set guioptions-=r                                   " Disable Right-hand scroll bar
        set guioptions-=R                                   " Disable Right-hand scroll bar is present when there is a vertically split window.
        set guioptions-=m                                   " Hide menu bar.
        set guioptions-=T                                   " Hide Toolbar.

        set lines=50                                        " Number of lines of the VIM window

        if IS_LINUX() && has('gui_running')                 " Set GUI font
            set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
        elseif IS_OSX() && has('gui_running')
            set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
        elseif IS_WINDOWS() && has('gui_running')
            set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256                                    " Enable 256 color.
        endif
    endif

    if has('clipboard')
        if has('unnamedplus')                               " When possible use + register for copy-paste.
            set clipboard=unnamed,unnamedplus
        else                                                " On mac and windows, use * register for copy-paste.
            set clipboard=unnamed
        endif
    endif
" }

" MISCELLANEOUS OPTIONS {
    " LANGUAGE
    set langmenu=en_US.UTF-8                                " Menu language.

    " WORD
    set spell                                               " Enable spell check.
    set spell spelllang=en_us                               " Enable spell check by English.

    set complete-=i                                         " Limit the files searched for auto-completes.
    set completeopt=longest,preview,menu                    " A comma separated list of options for Insert mode completion.

    set lazyredraw                                          " Don't update screen during macro and script execution.
    set magic                                               " Turn on automatic escaping.
    set regexpengine=1
    set cryptmethod=blowfish2                               " Crypt method.
    set ttimeout
    set ttyfast
    set ttymouse=xterm
    set updatetime=300
" }

" UI OPTIONS {
    " COLOR
    set background=dark                                     " Use colors that suit a dark background.
    colorscheme industry                                    " Change color scheme.

    " ERROR
    set noerrorbells                                        " Disable beep on errors.
    set visualbell                                          " Flash the screen instead of beeping on errors.

    " MOUSE
    set mouse=a                                             " Enable mouse of scrolling and resizing.
    set mousehide                                           " Hide mouse cursor when typing.

    set keymodel=startsel,stopsel

    " BUFFER, TAB
    set hidden                                              " Hide files the in the background instead of closing them.
    set tabpagemax=15                                       " Maximum number of tab pages that can be opened from the command line.
    set virtualedit=block,onemore                           " Allow beyond the last character on the right.

    " WINDOW
    set title                                               " Set the window's title, reflecting the file currently being edited.
    set textwidth=120                                       " Line wrap (number of cols).
    set winminheight=0                                      " Minimum window height.

    set scrolloff=3                                         " The number of screen columns to keep to the left and right of the cursor.
    set sidescrolloff=3                                     " The number of screen columns to keep to left and right of the cursor.

    set linespace=0                                         " Number of line spacing.
    set scrolljump=5                                        " Number of lines scrolled when the cursor leaves then screen.
    set scrolloff=3                                         " Minimum number of lines to keep above and below the cursor.

    " LAYOUT
    set splitright                                          " The newly subdivided vertical window is on the right.
    "set splitbelow                                         " The newly split horizontal window is located below.

    " WRAP
    set nowrap                                              " Turn off automatic wrapping.
    set wrapmargin=1                                        " Number of characters from the right window border where wrapping starts.

    set linebreak                                           " Break lines at word(requires Wrap lines).
    set showbreak=+++                                       " Wrap-broken line prefix.

    " CODE FOLDING
    set nofoldenable                                        " Disable folding by default.
    set foldmethod=syntax                                   " Fold based on indention levels.
    set foldnestmax=-1                                      " Only fold up to three nested levels.

    " NUMBER
    set number                                              " Show line numbers on the sidebar.
    set relativenumber                                      " Show line number on the current line and relative numbers on all other lines.

    " HIGHLIGHT
    syntax on                                               " Enable syntax highlighting.
    set showmatch                                           " Highlight all search results.
    set matchtime=5
    set matchpairs+=<:>                                     " Use %  to jum between pairs

    set cursorline                                          " Highlight the line currently under cursor.

    highlight clear SignColumn                              " Sign column should match background.
    highlight clear LineNr                                  " Current line number row will has same background color in relative.

    " RULER
    set ruler                                               " Always show cursor position.
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
                                                            " Ruler format.
    " STATUS LINE
    set laststatus=2                                        " Always display the status bar.

    "set statusline=%<%f\                                   " File name.
    "set statusline+=%w%h%m%r                               " Option.
    "set statusline+=\ [%{&ff}/%Y]                          " File type.
    "set statusline+=\ [%{getcwd()}]                        " Current Directory.
    "set statusline+=%=%-14.(%l,%c%V%)\ %p%%                " Navigation information Align right.

    set cmdheight=1                                         " Number of command line height.
    set showcmd                                             " Show current command.
    set showmode                                            " Show current mode.
    set display+=lastline                                   " Always try to show a paragraph's last line.
    set nomodeline                                          " Ignore file's mode lines.

    " COMMAND LINE
    set wildmenu                                            " Display command line's tab complete options as a menu.
    set wildmode=list,longest,full                          " Completion mode that is used for the character.
    set wildignore+=.pyc,.swp                               " Ignore files matching these patterns when opening files based on a glob pattern.
" }

" EDIT OPTIONS {
    " INDENT
    filetype indent on                                      " Enable indentation rules that are file-type specific.
    set autoindent                                          " New lines inherit the indentation of previous lines.
    set smartindent                                         " Enable smart-indent.

    set expandtab                                           " Convert tabs to spaces.
    set tabstop=4                                           " Indent using four spaces.

    set shiftwidth=4                                        " Number of auto-indent spaces.
    set shiftround                                          " When shifting lines, round the indentation to nearest multiple of "shiftwidth".
    set smarttab                                            " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
    set softtabstop=4                                       " Number of spaces that a <Tab> counts for while performing editingoperations, like inserting a <Tab> or using <BS>.
    set nojoinspaces                                        " Insert two spaces after a '.', '?' and '!' with a join command.

    " SEARCH
    set hlsearch                                            " Enable search highlighting.
    set ignorecase                                          " Ignore case when searching.
    set incsearch                                           " Incremental search that shows partial matches.
    set smartcase                                           " Automatically switch search to case-sensitive when search query contains an uppercase letter.
    set gdefault                                            " Enable global replacement.
    set nowrapscan                                          " Searches wrap around the end of the file.

    " WORD
    set backspace=indent,eol,start                          " Backspace behaviour.
    set whichwrap=b,s,h,l,<,>,[,]                           " Wrap keys.
    set iskeyword-=.,#,-,_$,@,%                             " Define the characters contained in a word.
    set formatoptions+=j                                    " Delete comment characters when joining lines.
    set nrformats-=octal                                    " Interpret octal as decimal when incrementing numbers.
    set nrformats+=alpha                                    " Allow alpha.

    set list                                                " Show all chars.
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.          " Highlight problematic whitespace.
" }

" FILE OPTIONS {
    " FILE
    set autoread                                            " Enable detect file change.
    set autowrite                                           " Enable auto write file.
    set autowriteall                                        " Auto-write all file changes.
    set autochdir                                           " Change working directory to open buffer.
    set confirm                                             " Prompt confirmation dialog.

    set nobackup                                            " Disable backup file.
    set nowritebackup

    set noswapfile                                          " Disable swap file.

    set backupdir=~/.vim/.backup//                          " Directory of backup.
    set directory=~/.vim/.swp//                             " Directory of swap.
    set undodir=~/.vim/.undo//                              " Directory of undo.

    if has('persistent_undo')
        set undofile                                        " Enable undo file.
        set undolevels=1000                                 " Number of undo levels.
        set undoreload=10000                                " Number of reload.
    endif

    set history=1000                                        " Number of history.
    set viminfo='1000,f1,<500
" }

" KEY MAPPINGS {
    let mapleader=','                                       " Leader key.
    let g:mapleader=mapleader

    "noremap j gj                                           " Seamlessly treat visual lines as actual lines when moving around.
    "noremap k gk
    "noremap <Down> gj
    "noremap <Up> gk
    "inoremap <Down> <C-o>gj
    "inoremap <Up> <C-o>gk

    " SHORTCUTS
    cmap cwd lcd %:p:h                                      " Change dir to cureent path.
    cmap cd. lcd %:p:h

    " SAVE AND QUIT
    nmap <leader>q :q<CR>                                   " Close.
    nmap <leader>w :w!<CR>                                  " Save.
    nmap <leader>WQ :wa<CR>:q<CR>                           " Save all.
    nmap <leader>Q :qa!<CR>                                 " Quit.
    cmap w!! w !sudo tee % >/dev/null                       " For when you  forget to sudo. Really Write the file.

    " WINDOW
    map <Leader>= <C-w>=                                    " Adjust view ports to the same size.
    nnoremap nw <C-W><C-W>                                  " Moving cursor to other windows.
    nnoremap <C-J> <C-W>j                                   " Down.
    nnoremap <C-K> <C-W>k                                   " UP.
    nnoremap <C-L> <C-W>l                                   " Right.
    nnoremap <C-H> <C-W>h                                   " Left.

    nnoremap <Leader><Tab> <C-W>w                           " Cycle through splits.
    " EASIER HORIZONTAL SCROLLING
    map zl zL                                               " Move the view on the text count characters to the right.
    map zh zH                                               " Halt a screen width.

    " FAST TAB
    map <S-H> gT                                            " Go to the next tab page.
    map <S-L> gt                                            " Go to the previous tab page.

    " CODE FOLDING OPTIONS
    nmap <leader>f0 :set foldlevel=0<CR>                    " Fold level 0.
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    " SOME HELPERS TO EDIT MODE
    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :table %%

    xnoremap <Leader>r :s///g<Left><Left>
    xnoremap <Leader>rc :s///gc<Left><Left><Left>

    nnoremap <silent> s* :let @/='<' . expand('<cword>') . '\>'<CR>cgn
                                                            " Search and replace
    xnoremap <silent> s* "sy:let @/=@s<CR>cgn

    map <Leader><Space> :let @/=''<CR>                      " Clear hight search.

    nnoremap <leader>g gqap                                 " Format paragraph(selected or not) to 80 character lines.
    xnoremap <Leader>g gqa

    xnoremap p pgvy                                         " Prevent selecting and pasting from overwriting what you originally copied.

    vmap y ygv<Esc>                                         " Keep cursor at the bottom of the visual selection after you yank it.

    " VISUAL SHIFTING
    vnoremap < <gv
    vnoremap > >gv
    vnoremap . :normal .<CR>                                " Allow using the repeat operator with a virsual selection.

    " LINE LOCATION
    nmap LB 0                                               " Star line.
    nmap LE $                                               " End line.
    nnoremap Y y$                                           " Copy to line end.

    map <Leader><F5> :setlocal spell!<CR>                   " Toggle spell check

    nnoremap <F7> :set list!<CR>                            " Toggle visually showing wall whitespace characters.
    inoremap <F7> <C-o>: set list!<CR>
    cnoremap <F7> <C-c>: set list!<CR>

    map <Leader>ev :tabnew $MYVIMRC<CR>                     " Edit Vim config file in a new tab.
    nnoremap <Leader>sv :source $MYVIMRC<CR>                " Load config file.

    " Toggle full screen
    map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
                                                            " Toggle quickfix window.
    " PASTE
    nnoremap <F12> :set invpaste paste? <CR>
    imap <F12> <C-O>:set invpaste paste?<CR>
    set pastetoggle=<F12>                                   " Paste mode.

    function! QuickFix_toggle()
        for i in range(1, winnr('$'))
            let bnum = winbufnr(i)
            if getbufvar(bnum, '&buftype') == 'quickfix'
                cclose
                return
            endif
        endfor

        copen
    endfunction
    nnoremap <silent> <Leader>c :call QuickFix_toggle()<CR>

    function! ToggleZoom(zoom)                              " Toggle zoom window.
        if exists('t:restore_zoom') && (a:zoom == v:true || t:restore_zoom.win != winnr())
            exec t:restore_zoom.cmd
            unlet t:restore_zoom
        elseif a:zoom
            let t:restore_zoom = { 'win': winnr(), 'cmd': winrestcmd() }
            exec "normal \<C-W>\|\<C-W>_"
        endif
    endfunction

    augroup restorezoom
        au WinEnter * silent! :call ToggleZoom(v:false)
    augroup END
    nnoremap <silent> <Leader>+ :call ToggleZoom(v:true)<CR>

    function! s:todo() abort                                " Function todo
        let entries = []
        for cmd in ['git grep -niIw -e TODO -e FIXME 2> /dev/null',
                \ 'grep -rniIw -e TODO -e FIXME . 2> /dev/null']
            let lines = split(system(cmd), '\n')
            if v:shell_error != 0 | continue | endif
            for line in lines
                let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
                call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
            endfor
            break
        endfor

        if !empty(entries)
            call setqflist(entries)
            copen
        endif
    endfunction

    command! Todo call s:todo()
" }

" PLUGINS MANAGER {
    filetype on
    filetype plugin on

    let vimplug_exists=expand('~/.vim/autoload/plug.vim')
    if !filereadable(vimplug_exists)
        if !executable('curl')
            echoerr 'You have to install curl or first install vim-plug yourself!'
            execute 'q!'
        endif
        echo 'Installing Vim-Plug...'
        echo ''
        silent exec '!\curl -fLo ' . vimplug_exists . ' --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
        autocmd VimEnter * PlugInstall
    endif

    call plug#begin('~/.vim/plugged')
        if (filereadable(expand('~/.vimrc.plugs.before')))
            source ~/.vimrc.plugs.before
        endif

        if (filereadable(expand('~/.vimrc.plugs.list')))
            source ~/.vimrc.plugs.list
        endif

        if (filereadable(expand('~/.vimrc.plugs.local')))
            source ~/.vimrc.plugs.local
        endif
    call plug#end()

    " LOAD PLUGINS CONFIG FILE
    if (filereadable(expand('~/.vimrc.plugs.conf')))
        source ~/.vimrc.plugs.conf
    endif
" }

" LOAD CONFIGURE FILE {
    if (filereadable(expand('~/.vimrc.local')))
        source ~/.vimrc.local
    endif
" }

" GVIMRC FILE {
    if has('gui_running')
        if filereadable(expand('~/.gvimrc.local'))
            source ~/.gvimrc.local
        endif
    endif
" }

