function! myspacevim#before() abort
    set clipboard+=unnamedplus
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'

    let g:ruby_host_prog = '/usr/bin/ruby'
endfunction

function! myspacevim#after() abort

endfunction
