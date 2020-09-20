au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })


function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <leader>cd <plug>(lsp-definition)
    nmap <buffer> <leader>cr <plug>(lsp-references)
    nmap <buffer> <leader>ci <plug>(lsp-implementation)
    nmap <buffer> <leader>ct <plug>(lsp-type-definition)
    nmap <buffer> <leader>crn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    " nmap <silent> <buffer> <leader>cd <plug>(lsp-definition)
    " nmap <silent> <buffer> <leader>/cd :ALEGoToDefinition -vsplit <CR>
    " nmap <silent> <buffer> <leader>-cd :ALEGoToDefinition -split <CR>

    " nmap <silent> <buffer> <leader>cf <plug>(lsp-references)
    " nmap <silent> <buffer> <leader>ci <plug>(lsp-hover)

    " refer to doc to add more commands
endfunction

augroup lsp_install_python
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_async_completion = 1
let g:asyncomplete_auto_completeopt = 0

" Não funciona no vim, apens no gVim
imap <c-space> <Plug>(asyncomplete_force_refresh)

" Não mostra flot com documentação do item que foi selecionado
" no meu de autocomplete
let g:lsp_documentation_float = 0
let g:lsp_preview_float = 0
