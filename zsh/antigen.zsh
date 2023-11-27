source $(dirname ${ZDOTDIR}/.zshrc)/antigen/antigen.zsh
antigen use oh-my-zsh

#antigen theme bhilburn/powerlevel9k powerlevel9k

antigen bundle starship
antigen bundle sudo
antigen bundle git
antigen bundle pip
antigen bundle command-not-found #depends on extra/pkgfile
antigen bundle git-prompt
antigen bundle git-flow
antigen bundle python
antigen bundle colorize #depends on package community/pygmentize
antigen bundle systemd
antigen bundle bgnotify
antigen bundle pass
antigen bundle encode64
antigen bundle kubectl
#antigen bundle pipenv
#antigen bundle poetry
antigen bundle poetry-env
antigen bundle rustc


antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions src

antigen apply
