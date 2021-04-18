let g:lsp_signature_help_enabled = 0

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

    nmap <silent> <buffer> <leader>/cd :leftabove LspDefinition<CR>
endfunction

augroup lsp_install_python
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_async_completion = 1
let g:asyncomplete_auto_completeopt = 0
let g:lsp_completion_documentation_enabled = 0
let g:asyncomplete_min_chars = 3

let g:lsp_documentation_float = 0
let g:lsp_preview_float = 0

" Muito útil para debugar um LSP server não funcional
let g:lsp_log_file = ''
