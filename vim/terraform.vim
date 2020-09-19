

"# https://github.com/juliosueiras/terraform-lsp
"# Apesar de ser para terraform <=0.12.0 funcoina melhor do
"# que o LSP ha hashicorp (https://github.com/hashicorp/terraform-ls)
"#
"# Basta baixar o binário e colocar no PATH com o nome `terraform-lsp`
"#
augroup Terraform
  autocmd!
  autocmd FileType tf set filetype=terraform
  autocmd FileType tfvars set filetype=terraform
augroup END
