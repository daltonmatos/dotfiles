
" Baixar o colocar o binário no PATH
" https://github.com/golang/tools/tree/master/gopls

au User lsp_setup call lsp#register_server({
        \ 'name': 'go-lang',
        \ 'cmd': {server_info->['gopls']},
        \ 'allowlist': ['go'],
        \ })
