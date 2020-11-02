augroup Terraform
  autocmd!

  autocmd BufNewFile,BufRead *.tfvars set filetype=terraform
  autocmd BufNewFile,BufRead *.tf set filetype=terraform

augroup END
