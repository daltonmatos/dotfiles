au User lsp_setup call lsp#register_server({
        \ 'name': 'terraform',
        \ 'cmd': {server_info->['terraform-lsp']},
        \ 'allowlist': ['terraform'],
        \ })

" https://github.com/juliosueiras/terraform-lsp
" Apesar de ser para terraform <=0.12.0 funcoina melhor do
" que o LSP ha hashicorp (https://github.com/hashicorp/terraform-ls)
"
" Basta baixar o binário e colocar no PATH com o nome `terraform-lsp`
"
augroup Terraform
  autocmd!

  autocmd BufNewFile,BufRead *.tfvars set filetype=terraform
  autocmd BufNewFile,BufRead *.tf set filetype=terraform

augroup END
