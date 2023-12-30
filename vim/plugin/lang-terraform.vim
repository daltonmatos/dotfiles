augroup Terraform
  autocmd!

  autocmd BufNewFile,BufRead,BufWritePost *.tfvars set filetype=terraform
  autocmd BufNewFile,BufRead,BufWritePost *.tf set filetype=terraform

augroup END
