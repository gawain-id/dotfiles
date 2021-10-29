function! myspacevim#before() abort
    set clipboard+=unnamedplus
    "let g:python_host_prog = '/usr/bin/python2'
    "let g:python3_host_prog = '/usr/bin/python3'

    "let g:ruby_host_prog = '/usr/bin/ruby'
    let g:python3_host_prog = 'd:\gpc\software\run\apps\dev\python\3.9.6\python.exe'
    set mouse=a

    let g:deoplete#sources#go#gocode_binary = 'C:\Users\gawai\go\bin\gopls.exe'
    let g:deoplete#enable_at_startup = 1

    if has('win32') || has('win64')
      " add extra paths.
      let s:extpaths=expand("$HOME/.SpaceVim.d/.vim.extpaths")
      if filereadable(s:extpaths)
        execute "source ".s:extpaths
      endif
    endif

    set autochdir
endfunction

function! myspacevim#after() abort

endfunction
