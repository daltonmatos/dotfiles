
# Antigen init
source $(dirname ${ZDOTDIR}/.zshrc)/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# Load the theme.
#antigen theme candy
antigen theme bhilburn/powerlevel9k powerlevel9k

# Bundles from the default repo (robbyrussell's oh-my-zsh).
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

# Tell antigen that you're done.
antigen apply
