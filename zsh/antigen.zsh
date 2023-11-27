source $(dirname ${ZDOTDIR}/.zshrc)/antigen/antigen.zsh
antigen use oh-my-zsh

#antigen theme bhilburn/powerlevel9k powerlevel9k

antigen bundle starship
antigen bundle sudo
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle command-not-found #depends on extra/pkgfile
antigen bundle git-prompt
antigen bundle git-flow
antigen bundle pip
antigen bundle python
antigen bundle colorize #depends on package community/pygmentize
antigen bundle systemd
antigen bundle Tarrasch/zsh-autoenv
antigen bundle t413/zsh-background-notify
antigen bundle pass

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions src

antigen apply
