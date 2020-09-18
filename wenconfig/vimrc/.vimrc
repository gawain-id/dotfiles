""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" WEN VIMRC CONFIG
"
" @file: ~/_vimrc
" @author: gawain.id@outlook.com
" @last: 20200918 20:15
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ENV {
    set nocompatible                                         " DISABLE COMPATIBLE WITH VI.

    let g:is_windows = has('win32') || has('win64')          " CHECK IS WINDOWS.
    let g:is_osx = has('macunix')                            " CHECK IS MACOS.
    let g:is_linux = has('unix') && !has('macunix') && !has('win32unix')
                                                             " CHECK IS LINUX.
" }

" GENERAL {
    " LANGUAGE
    set langmenu=en_US.UTF-8                                 " MENU LANGUAGE.

    " SPELL
    set spell                                                " ENABLE SPELL CHECK.
    set spell spelllang=en_us                                " ENABLE SPELL CHECK BY ENGLISH.

    " ENCODING
    set encoding=utf-8                                       " USE AND ENCODING THAT SUPPORTS UNICODE.
    set termencoding=utf-8                                   " TERMINAL ENCODING.
    set fileencodings=ucs-bom,\
                        \utf-8,
                        \cp936,
                        \gb19030,
                        \big5,
                        \euc-jp,
                        \euc-kr,
                        \latin1
                                                             " DETECT FILE ENCODING IN ORDER.

    " RUNTIMEPATH
    if g:is_windows                                          " SET RUNTIMEPATH.
        set runtimepath+=$HOME/.vim
        set runtimepath+=$VIM/vimfiles
        set runtimepath+=$VIMRUNTIME
        set runtimepath+=$VIM/vimfiles/after
        set runtimepath+=$HOME/.vim/after
    endif

    " FILE FORMAT
    if g:is_windows                                          " SET FILE FORMAT.
        set fileformat=dos
    else
        set fileformat=unix
    endif

    " SHELL
    if !g:is_windows
        set shell=/bin/sh                                    " THE SHELL USED TO EXECUTE COMMANDS.
    endif

    set shortmess+=filmnrxoOtT                               " SHOW PROMPTS CAUSED BY FILE MESSAGES.
    set viewoptions+=curdir,folds,options,cursor,unix,slash  " SAVING AND RESTORING SOMETHING.

    set lazyredraw                                           " DON'T UPDATE SCREEN DURING MACRO AND SCRIPT EXECUTION.
    set magic                                                " TURN ON AUTOMATIC ESCAPING.
    set regexpengine=1
    set cryptmethod=blowfish2                                " CRYPT METHOD.

    set ttimeout
    set ttyfast
    set ttymouse=xterm
    set updatetime=300

    set complete-=i                                          " LIMIT THE FILES SEARCHED FOR AUTO-COMPLETES.
    set completeopt=longest,preview,menu                     " A COMMA SEPARATED LIST OF OPTIONS FOR INSERT MODE COMPLETION.
" }

" UI {
    " GUI
    if has("gui_running")
        set guicursor=a:block-blinkon0                       " DISABLE BLINKING CURSOR.

        set guioptions-=m                                    " HIDE MENU BAR.
        set guioptions-=T                                    " HIDE TOOLBAR.

        set guioptions-=l                                    " DISABLE LEFT-HAND SCROLL BAR.
        set guioptions-=L                                    " DISABLE LEFT-HAND SCROLL BAR IS PRESENT WHEN THERE IS A VERTICALLY SPLIT WINDOW.
        set guioptions-=r                                    " DISABLE RIGHT-HAND SCROLL BAR
        set guioptions-=R                                    " DISABLE RIGHT-HAND SCROLL BAR IS PRESENT WHEN THERE IS A VERTICALLY SPLIT WINDOW.

    endif

    " LINES
    if has("gui_running")
        set lines=50                                         " NUMBER OF LINES OF THE VIM WINDOW
    endif

    " FONT
    if has("gui_running")                                    " SET GUI FONT
        if g:is_linux
            set guifont=Hack\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
        elseif g:is_osx
            set guifont=Hack\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
        elseif g:is_windows
            set guifont=Hack:h10.5,Consolas:h10,Courier_New:h10
        endif
    endif

    " MOUSE
    set mouse=a                                              " ENABLE MOUSE OF SCROLLING AND RESIZING.
    set mousehide                                            " HIDE MOUSE CURSOR WHEN TYPING.

    " CLIPBOARD
    if has('clipboard')
        if has('unnamedplus')                                " WHEN POSSIBLE USE + REGISTER FOR COPY-PASTE.
            set clipboard=unnamed,unnamedplus
        else                                                 " ON MAC AND WINDOWS, USE * REGISTER FOR COPY-PASTE.
            set clipboard=unnamed
        endif
    endif

    " ERROR
    set noerrorbells                                         " DISABLE BEEP ON ERRORS.
    set visualbell                                           " FLASH THE SCREEN INSTEAD OF BEEPING ON ERRORS.

    " SYNTAX
    syntax enable                                            " ENABLE SYNTAX HIGHLIGHTING.
    syntax on

    " COLOR
    if !has("gui_running")
        if &term == "xterm" || &term == "screen"
            set t_Co=256                                     " ENABLE 256 COLOR.
        endif
    endif

    " COLOR SCHEME
    set background=dark                                      " USE COLORS THAT SUIT A DARK BACKGROUND.
    colorscheme desert                                       " CHANGE COLOR SCHEME.
" }

" UI {
    " BUFFER, TAB
    set hidden                                               " HIDE FILES THE IN THE BACKGROUND INSTEAD OF CLOSING THEM.
    set tabpagemax=50                                        " MAXIMUM NUMBER OF TAB PAGES THAT CAN BE OPENED FROM THE COMMAND LINE.
    set virtualedit=block,onemore                            " ALLOW BEYOND THE LAST CHARACTER ON THE RIGHT.
    set keymodel=startsel,stopsel

    " WINDOW
    set title                                                " SET THE WINDOW'S TITLE, REFLECTING THE FILE CURRENTLY BEING EDITED.
    set textwidth=120                                        " LINE WRAP (NUMBER OF COLS).
    set winminheight=0                                       " MINIMUM WINDOW HEIGHT.


    set scrolloff=3                                          " THE NUMBER OF SCREEN COLUMNS TO KEEP TO THE LEFT AND RIGHT OF THE CURSOR.
    set sidescrolloff=3                                      " THE NUMBER OF SCREEN COLUMNS TO KEEP TO LEFT AND RIGHT OF THE CURSOR.

    set linespace=0                                          " NUMBER OF LINE SPACING.
    set scrolljump=5                                         " NUMBER OF LINES SCROLLED WHEN THE CURSOR LEAVES THEN SCREEN.
    set scrolloff=3                                          " MINIMUM NUMBER OF LINES TO KEEP ABOVE AND BELOW THE CURSOR.

    " LAYOUT
    set splitright                                           " THE NEWLY SUBDIVIDED VERTICAL WINDOW IS ON THE RIGHT.
    "set splitbelow                                          " THE NEWLY SPLIT HORIZONTAL WINDOW IS LOCATED BELOW.

    " WRAP
    set nowrap                                               " TURN OFF AUTOMATIC WRAPPING.
    set wrapmargin=1                                         " NUMBER OF CHARACTERS FROM THE RIGHT WINDOW BORDER WHERE WRAPPING STARTS.

    set linebreak                                            " BREAK LINES AT WORD(REQUIRES WRAP LINES).
    set showbreak=+++                                        " WRAP-BROKEN LINE PREFIX.

    " FOLD
    set nofoldenable                                         " DISABLE FOLDING BY DEFAULT.
    set foldmarker={,}
    set foldlevel=0
    set foldmethod=marker                                    " FOLD BASED ON INDENTION LEVELS.
    set foldnestmax=-1                                       " ONLY FOLD UP TO THREE NESTED LEVELS.

    " NUMBER
    set number                                               " SHOW LINE NUMBERS ON THE SIDEBAR.
    set relativenumber                                       " SHOW LINE NUMBER ON THE CURRENT LINE AND RELATIVE NUMBERS ON ALL OTHER LINES.

    " HIGHLIGHT
    set showmatch                                            " HIGHLIGHT ALL SEARCH RESULTS.
    set matchtime=5
    set matchpairs+=<:>                                      " USE % TO JUM BETWEEN PAIRS

    set cursorline                                           " HIGHLIGHT THE LINE CURRENTLY UNDER CURSOR.

    highlight clear SignColumn                               " SIGN COLUMN SHOULD MATCH BACKGROUND.
    highlight clear LineNr                                   " CURRENT LINE NUMBER ROW WILL HAS SAME BACKGROUND COLOR IN RELATIVE.

    " RULER
    set ruler                                                " ALWAYS SHOW CURSOR POSITION.
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)       " RULER FORMAT.

    " STATUS LINE
    set laststatus=2                                         " ALWAYS DISPLAY THE STATUS BAR.

    "set statusline=%<%f\                                    " FILE NAME.
    "set statusline+=%w%h%m%r                                " OPTION.
    "set statusline+=\ [%{&ff}/%Y]                           " FILE TYPE.
    "set statusline+=\ [%{getcwd()}]                         " CURRENT DIRECTORY.
    "set statusline+=%=%-14.(%l,%c%V%)\ %p%%                 " NAVIGATION INFORMATION ALIGN RIGHT.

    set cmdheight=1                                          " NUMBER OF COMMAND LINE HEIGHT.
    set showcmd                                              " SHOW CURRENT COMMAND.
    set showmode                                             " SHOW CURRENT MODE.
    set display+=lastline                                    " ALWAYS TRY TO SHOW A PARAGRAPH'S LAST LINE.
    set nomodeline                                           " IGNORE FILE'S MODE LINES.

    " COMMAND LINE
    set wildmenu                                             " DISPLAY COMMAND LINE'S TAB COMPLETE OPTIONS AS A MENU.
    set wildmode=list,longest,full                           " COMPLETION MODE THAT IS USED FOR THE CHARACTER.
    set wildignore=*/tmp/*,*.so,*.swp,*.zip,*.o,*.obj,*~,*.pyc
    if has("win16") || has("win32")
        set wildignore+=.git\*,.hg\*,.svn\*
    else
        set wildignore+=*/.git/*,*/.hg/*,*/.svn*,*/.DS_Store
    endif
                                                             " IGNORE FILES MATCHING THESE PATTERNS WHEN.
" }

" EDIT {
    " INDENTION
    set autoindent                                           " NEW LINES INHERIT THE INDENTATION OF PREVIOUS LINES.
    set smartindent                                          " ENABLE SMART-INDENT.

    set expandtab                                            " CONVERT TABS TO SPACES.
    set tabstop=4                                            " INDENT USING FOUR SPACES.

    set shiftwidth=4                                         " NUMBER OF AUTO-INDENT SPACES.
    set noshiftround                                         " WHEN SHIFTING LINES, ROUND THE INDENTATION TO NEAREST MULTIPLE OF 'SHIFTWIDTH'.
    set smarttab                                             " WHEN ON, A <TAB> IN FRONT OF A LINE INSERTS BLANKS ACCORDING TO 'SHIFTWIDTH'.
    set softtabstop=4                                        " NUMBER OF SPACES THAT A <TAB> COUNTS FOR WHILE PERFORMING EDITINGOPERATIONS, LIKE INSERTING A <TAB> OR USING <BS>.
    set nojoinspaces                                         " INSERT TWO SPACES AFTER A '.', '?' AND '!' WITH A JOIN COMMAND.

    " SEARCH
    set hlsearch                                             " ENABLE SEARCH HIGHLIGHTING.
    set ignorecase                                           " IGNORE CASE WHEN SEARCHING.
    set incsearch                                            " INCREMENTAL SEARCH THAT SHOWS PARTIAL MATCHES.
    set smartcase                                            " AUTOMATICALLY SWITCH SEARCH TO CASE-SENSITIVE WHEN SEARCH QUERY CONTAINS AN UPPERCASE LETTER.
    set gdefault                                             " ENABLE GLOBAL REPLACEMENT.
    set nowrapscan                                           " SEARCHES WRAP AROUND THE END OF THE FILE.

    " WORD
    set backspace=indent,eol,start                           " BACKSPACE BEHAVIOUR.
    set whichwrap=b,s,h,l,<,>,[,]                            " WRAP KEYS.
    set iskeyword-=.,#,-,_$,@,%                              " DEFINE THE CHARACTERS CONTAINED IN A WORD.
    set formatoptions+=j                                     " DELETE COMMENT CHARACTERS WHEN JOINING LINES.
    set nrformats-=octal                                     " INTERPRET OCTAL AS DECIMAL WHEN INCREMENTING NUMBERS.
    set nrformats+=alpha                                     " ALLOW ALPHA.

    set nolist                                               " SHOW ALL CHARS.
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.           " HIGHLIGHT PROBLEMATIC WHITESPACE.
" }

" FILE {
    set autoread                                             " ENABLE DETECT FILE CHANGE.
    set autowrite                                            " ENABLE AUTO WRITE FILE.
    set autowriteall                                         " AUTO-WRITE ALL FILE CHANGES.

    set autochdir                                            " CHANGE WORKING DIRECTORY TO OPEN BUFFER.
    set confirm                                              " PROMPT CONFIRMATION DIALOG.

    set nobackup                                             " DISABLE BACKUP FILE.
    set nowritebackup
    set noswapfile                                           " DISABLE SWAP FILE.

    set backupdir=~/.vim/.backup//                           " DIRECTORY OF BACKUP.
    set directory=~/.vim/.swp//                              " DIRECTORY OF SWAP.
    set undodir=~/.vim/.undo//                               " DIRECTORY OF UNDO.

    if has('persistent_undo')
        set undofile                                         " ENABLE UNDO FILE.
        set undolevels=1000                                  " NUMBER OF UNDO LEVELS.
        set undoreload=10000                                 " NUMBER OF RELOAD.
    endif

    set history=1000                                         " NUMBER OF HISTORY.
    set viminfo='1000,f1,<500
" }

" KEY {
    " LEADER
    let mapleader=','                                        " LEADER KEY.
    let maplocalleader = '<Space>'


    if has('autocmd')
        
    endif

    filetype indent on                                       " ENABLE INDENTATION RULES THAT ARE FILE-TYPE SPECIFIC.

    " CONFIG FILE
    map <Leader>ev :tabnew $MYVIMRC<CR>                      " EDIT VIM CONFIG FILE IN A NEW TAB.
    nnoremap <Leader>sv :source $MYVIMRC<CR>                 " LOAD CONFIG FILE.

    " SAVE AND QUIT
    nmap <leader>q :q<CR>                                    " CLOSE.
    nmap <leader>w :w!<CR>                                   " SAVE.
    nmap <leader>WQ :wa<CR>:q<CR>                            " SAVE ALL.
    nmap <leader>Q :qa!<CR>                                  " QUIT.
    cmap w!! w !sudo tee % >/dev/null                        " FOR WHEN YOU FORGET TO SUDO. REALLY WRITE THE FILE.

    " SHORTCUTS
    cmap cwd lcd %:p:h                                       " CHANGE DIR TO CUREENT PATH.
    cmap cd. lcd %:p:h

    " WINDOW
    map <Leader>= <C-w>=                                     " ADJUST VIEW PORTS TO THE SAME SIZE.

    nnoremap <Leader><Tab> <C-W>w                            " CYCLE THROUGH SPLITS.
    nnoremap nw <C-W><C-W>                                   " MOVING CURSOR TO OTHER WINDOWS.

    nnoremap <C-J> <C-W>j                                    " WINDOW CURSOR DOWN.
    nnoremap <C-K> <C-W>k                                    " WINDOW CURSOR UP.
    nnoremap <C-L> <C-W>l                                    " WINDOW CURSOR RIGHT.
    nnoremap <C-H> <C-W>h                                    " WINDOW CURSOR LEFT.

    " INSER MODE
    inoremap <C-k> <Up>
    inoremap <C-j> <Down>
    inoremap <C-a> <Home>
    inoremap <C-e> <End>

    " COMMAND MODE
    cnoremap <C-j> <t_kd>
    cnoremap <C-k> <t_ku>
    cnoremap <C-a> <Home>
    cnoremap <C-e> <End>

    " FAST TAB
    map <S-H> gT                                             " GO TO THE NEXT TAB PAGE.
    map <S-L> gt                                             " GO TO THE PREVIOUS TAB PAGE.

    " WRAPPED LINES GOES DOWN/UP TO NEXT ROW, RATHER THAN NEXT LINE IN FILE.
    noremap j gj
    noremap k gk

    " VIRSUAL SHIFTING (DOES NOT EXIT VISUAL MODE)
    vnoremap < <gv
    vnoremap > >gv
    vnoremap . :normal .<CR>                                 " ALLOW USING THE REPEAT OPERATOR WITH A VIRSUAL SELECTION.

    " LINE LOCATION
    nmap LB 0                                                " LINE HEAD.
    nmap LE $                                                " LINE END.

    nnoremap Y y$                                            " COPY TO LINE END.

    nnoremap gu gU                                           " TO UPPERCASE
    nnoremap gl gu                                           " TO LOWERCASE

    " EASIER HORIZONTAL SCROLLING
    map zl zL                                                " MOVE THE VIEW ON THE TEXT COUNT CHARACTERS TO THE RIGHT.
    map zh zH                                                " HALT A SCREEN WIDTH.

    nnoremap <silent> <leader>q qwip                         " EASIER FORMATTING

    " PAIRING BRACES
    inoremap <> <><Left>
    inoremap () ()<Left>
    inoremap {} {}<Left>
    inoremap [] []<Left>
    inoremap "" ""<Left>
    inoremap '' ''<Left>
    inoremap '' ''<Left>
    inoremap `` ``<Left>

    " CODE FOLDING OPTIONS
    nmap <leader>f0 :set foldlevel=0<CR>                     " FOLD LEVEL 0.
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    nnoremap <space> @=((foldclosed(line('.') < 0) ? 'zc' : 'zo'))<CR>

    " SOME HELPERS TO EDIT MODE
    cnoremap %% <C-R>=fnameescape(expand('%:h')) . '/'<CR>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :table %%

    xnoremap <Leader>r :s///g<Left><Left>
    xnoremap <Leader>rc :s///gc<Left><Left><Left>

    nnoremap <silent> s* :let @/='<' . expand('<cword>') . '\>'<CR>cgn
                                                             " SEARCH AND REPLACE
    xnoremap <silent> s* "sy:let @/=@s<CR>cgn
                                                             " CLEAR HIGHT SEARCH.
    map <Leader><Space> :let @/=''<CR>

    nnoremap <leader>g gqap                                  " FORMAT PARAGRAPH(SELECTED OR NOT) TO 80 CHARACTER LINES.
    xnoremap <Leader>g gqa

    xnoremap p pgvy                                          " PREVENT SELECTING AND PASTING FROM OVERWRITING WHAT YOU ORIGINALLY COPIED.

    vmap y ygv<Esc>                                          " KEEP CURSOR AT THE BOTTOM OF THE VISUAL SELECTION AFTER YOU YANK IT.

    map <F6> :setlocal spell!<CR>                            " TOGGLE SPELL CHECK
    nnoremap <F7> :set list!<CR>                             " TOGGLE VISUALLY SHOWING WALL WHITESPACE CHARACTERS.
    inoremap <F7> <C-o>: set list!<CR>
    cnoremap <F7> <C-c>: set list!<CR>

    " PASTE
    nnoremap <F10> :set invpaste paste? <CR>
    imap <F10> <C-O>:set invpaste paste?<CR>
    set pastetoggle=<F10>                                    " PASTE MODE.

    " TOGGLE FULL SCREEN
    map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
                                                             " TOGGLE QUICKFIX WINDOW.
    " TOOGLE FUNCTION
    function! Toggle_QuickFix()
        for i in range(1, winnr('$'))
            let bnum = winbufnr(i)
            if getbufvar(bnum, '&buftype') == 'quickfix'
                cclose
                return
            endif
        endfor
        copen
    endfunction
    nnoremap <silent> <Leader>c :call Toggle_QuickFix()<CR>
                                                             " FUNCTION TOGGLE ZOOM WINDOW
    function! Toggle_Zoom(zoom)
        if exists('t:restore_zoom') && (a:zoom == v:true || t:restore_zoom.win != winnr())
            exec t:restore_zoom.cmd
            unlet t:restore_zoom
        elseif a:zoom
            let t:restore_zoom = { 'win': winnr(), 'cmd': winrestcmd() }
            exec "normal \<C-W>\|\<C-W>_"
        endif
    endfunction

    augroup restorezoom
        au WinEnter * silent! :call Toggle_Zoom(v:false)
    augroup END
    nnoremap <silent> <Leader>+ :call Toggle_Zoom(v:true)<CR>
                                                             " FUNCTION TODO
    function! s:todo() abort
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

" PLUGINS {
    " VIM-PLUG INSTALL
    let home_dir = expand('~')
    if g:is_windows
        if has('nvim')
            let share_dir = home_dir . '\AppData\Local\nvim'
        else
            let share_dir = home_dir . '\.vim'
        endif

        let vim_plug = share_dir . '\autoload\plug.vim'
        let vim_plug_install = share_dir . '\plugged'
    else
        if has('nvim')
            let share_dir = home_dir . './local/share/nvim/site'
        else
            let share_dir = home_dir '/.vim'
        endif

        let vim_plug = share_dir . '/autoload/plug.vim'
        let vim_plug_install = share_dir . '/plugged'
    endif

    " URL OF THE VIM-PLUG SCRIPT.
    let vim_plug_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    if empty(glob(expand(vim_plug)))
        if g:is_windows
            " MAKE SURE THE AUTOLOAD DIRECTORY HAS BEEN CREATED.
            silent! exec '!md ' . share_dir . '\autoload'
            " DOWNLOAD VIM-PLUG USING POWERSHELL.
            silent! exec '!powershell -command Invoke-WebRequest -Uri "' . vim_plug_url .  '" -OutFile "' . vim_plug . '"'
        else
            " DOWNLOAD VIM-PLUG USING CURL.
            silent! exec '!curl -fLo ' . vim_plug . ' --create_dirs ' . vim_plug_url
        endif

        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    " PLUGINS LIST
    filetype on
    filetype plugin on

    call plug#begin(vim_plug_install)
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

    " LOAD CONFIGURE FILE
    if (filereadable(expand('~/.vimrc.local')))
        source ~/.vimrc.local
    endif

    if has('gui_running')
        if filereadable(expand('~/.gvimrc.local'))
            source ~/.gvimrc.local
        endif
    endif

" }
